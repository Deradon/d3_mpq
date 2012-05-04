class ModCode < BinData::Record
  endian  :little

  uint32  :mod_code
  uint32  :mod_param1
  uint32  :mod_param2
  uint32  :mod_param3
  uint32  :mod_offset
  uint32  :mod_length

  # Returns: nil if mod_code is 0xFFFFFFFF, mod_code otherwise
  def id
    self.mod_code == 0xFFFFFFFF ? nil : self.mod_code.to_i
  end

  # HACK
  # Returns: Instance of BinData::Record that respond to :variable_content
  def base
    parent.parent.parent.parent
  end

  def index
    (mod_offset - base.data_num_bytes - base.data_offset) / 4
  end

  def count
    mod_length / 4
  end

  def data
    base.variable_content[index, count]
  end

  def empty?
    mod_length == 0
  end

  def min
    stack.min || 0.0
  end

  def max
    stack.max || 0.0
  end

  def stack
    @stack ||= Stack.new(data)
  end

  private

  # Pseudo-Stack to compute min/max of current ModCode
  #
  # FIX: min / max
  #      It currently only works for a simple Attribute like: rand(a,b)
  #      Chained Attribute with more OP-Codes will fail
  #      NOTE: x / rand(a,b) works too
  class Stack
    attr_reader :value

    def initialize(data)
      @stack  = []
      @data   = *data
      @value  = nil
      parse
    end

    def min
      @value.min
    end

    def max
      @value.max
    end

    def push(item)
      @stack.push item
    end

    def pop
      @stack.pop
    end

    def peek
      @stack.last
    end

    def count
      @stack.length
    end

    def empty?
      count == 0
    end

    # Lets go
    def parse
      return @value if @value

      @trace = []
      skip = false

      @data.each_with_index do |e, index|
        if skip
          skip = false
          next
        end

        op = e.bytes.first
        case op
        when 0x00
          # return the value at the top of the stack
          return @value = pop
        when 0x01
          # call the function of the next op-code (just pass here)
        when 0x03
          # rand1(A,B); pop 2 numbers and push a random value between A and A+B
          op { |a,b| ["rand(A,A+B)", a, a + b] }
        when 0x04
          # rand2(A,B); pop 2 numbers and push a random value between A and B
          op { |a,b| ["rand(A,B)", a, b] }
        when 0x06
          # push the next DWord onto the stack
          push StackValue.new(@data[index+1].unpack('F').first)
          skip = true
        when 0x0B
          # add(A,B); pop 2 numbers and push the sum
          op { |a,b| ["add(A,B)", (a + b)] }
        when 0x0C
          # sub(A,B); pop 2 numbers and push the difference
          op { |a,b| ["sub(A,B)", (a - b)] }
        when 0x0D
          # mul(A,B); pop 2 numbers and push the product
          op { |a,b| ["mul(A,B)", (a * b)] }
        when 0x0E
          # div(A,B); pop 2 numbers and push the quotient
          op { |a,b| ["div(A,B)", (a / b)] }
        else
          raise "OP-Code not found: #{op} | #{@data.inspect}"
        end
      end

      raise "No return found: #{@data.inspect}"
    end

    # Perform OP-Code
    def op(&blk)
      a = pop
      b = pop

      a = StackValue.new(a) unless a.is_a?(StackValue)
      b = StackValue.new(b) unless b.is_a?(StackValue)

      formula, min, max = blk.call(a, b)
      r = (max ||= min).dup

      r.min = [min.min, max.min].min
      r.max = [min.max, max.max].max
      r.value = (r.max == r.min) ? r.min : rand_range(r.min, r.max)

      push(r)
      @trace << Trace.new(a, b, formula, r)
    end

    def inspect
      {
        :value => @value,
        :trace => @trace
      }
    end

    # helper to rand in range of two floats
    def rand_range(min, max)
      rand * (max - min) + min
    end

    class Trace < Struct.new(:a, :b, :formula, :x)
    end

    # Wrapper for a Float that handles: current_value, min_value, max_value
    class StackValue
      attr_accessor :value, :min, :max

      def initialize(value, min = nil, max = nil)
        @value = value
        @min   = min || value
        @max   = max || value

        # HACK: to be sure
        @min, @max = @max, @min if @min > @max
      end

      def -(oth)
        StackValue.new(value - oth.value, min - oth.min, max - oth.max)
      end

      def +(oth)
        StackValue.new(value + oth.value, min + oth.min, max + oth.max)
      end

      def *(oth)
        StackValue.new(value * oth.value, min * oth.min, max * oth.max)
      end

      def /(oth)
        StackValue.new(value/oth.value, min/oth.min, max/oth.max)
      end
    end
  end
end

