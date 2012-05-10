class MinMax
  attr_reader :min, :max

  def initialize(min = nil, max = nil)
    min ||= 0.0
    max ||= min
    @min, @max = (min <= max) ? [min, max] : [max, min]
  end

  def +(oth)
    MinMax.new(self.min + oth.min, self.max + oth.max)
  end

  def -(oth)
    MinMax.new(self.min - oth.max, self.max - oth.min)
  end

  # HACK: use a more clever solution
  def *(oth)
    v = possible_values(self, oth){ |a, b| a * b }
    MinMax.new(v.min, v.max)
  end

  # HACK: use a more clever solution
  def /(oth)
    v = possible_values(self, oth){ |a, b| a / b }
    MinMax.new(v.min, v.max)
  end

  # Returns: A random value between min and max
  def random
    (min == max) ? min : rand * (max - min) + min
  end

  private
  # Returns: Array
  def possible_values(a, b, &block)
    values = []
    values << block.call(a.min, b.min)
    values << block.call(a.min, b.max)
    values << block.call(a.max, b.min)
    values << block.call(a.max, b.max)

    return values
  end
end

