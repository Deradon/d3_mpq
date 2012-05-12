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

  def trace
    stack.trace
  end

  def stack
    @stack ||= Stack.new(data)
  end

  private

  # Pseudo-Stack to compute min/max of current ModCode
  class Stack
    attr_reader :value, :trace

    def initialize(data)
      @stack  = []
      @trace  = []
      @data   = *data
      @value  = nil
      parse
    end

    def min
      @value ? @value.min : nil
    end

    def max
      @value ? @value.max : nil
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
      return nil if @data.empty?

      next_op = true
      @data.each_with_index do |dword, index|
        next_op = true and next unless next_op

        case dword.bytes.first
        when 0x00
          # return the value at the top of the stack
          raise "Return found, but Stack not empty!" if @data[index+1]
          return @value = pop
        when 0x01
          # call the function of the next op-code (just pass here)
        when 0x03
          # rand1(A,B); pop 2 numbers and push a random value between A and A+B
          op { |a, b| ["rand", a, a + b] }
        when 0x04
          # rand2(A,B); pop 2 numbers and push a random value between A and B
          op { |a, b| ["rand2", a, b] }
        when 0x06
          # push the next DWord onto the stack
          v = @data[index+1].unpack('F').first
          push(StackValue.new(v))
          @trace << "#{v}"
          next_op = false
        when 0x0B
          # add(A,B); pop 2 numbers and push the sum
          op { |a, b| ["add", (a + b)] }
        when 0x0C
          # sub(A,B); pop 2 numbers and push the difference
          op { |a, b| ["sub", (a - b)] }
        when 0x0D
          # mul(A,B); pop 2 numbers and push the product
          op { |a, b| ["mul", (a * b)] }
        when 0x0E
          # div(A,B); pop 2 numbers and push the quotient
          op { |a, b| ["div", (a / b)] }
        else
          raise "OP-Code not found: #{op} | #{@data.inspect}"
        end
      end

      raise "No return found: #{@data.inspect}"
    end

    # Perform OP-Code
    def op(&blk)
      b = pop
      a = pop

      formula, min, max = blk.call(a, b)

      push(StackValue.random(min, min || max))
      @trace << formula
    end

    def inspect
      { :value => @value, :trace => @trace}
    end

    # Wrapper for a Float that handles: current_value, min_value, max_value
    class StackValue
      attr_accessor :value, :min_max

      def self.random(min, max)
        StackValue.new(MinMax.new(min.min, max.max).random, min.min, max.max)
      end

      def initialize(value, min = nil, max = nil)
        @value   = value
        min    ||= @value
        @min_max = MinMax.new(min, max)
      end

      [:min, :max].each { |m| define_method(m) { min_max.send(m) } }
      ["-", "+", "*", "/"].each do |m|
        define_method(m) { |sv| with_other(sv){ |a, b| a.send(m, b) } }
      end

      def to_s
        (min == max) ? "#{min}" : "#{min}..#{max}"
      end

      private
      def with_other(oth, &block)
        mm = block.call(min_max, oth.min_max)
        v  = block.call(value, oth.value)
        StackValue.new(v, mm.min, mm.max)
      end
    end
  end
end

