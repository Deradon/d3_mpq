class BinData::DSLMixin::DSLParser
  # Example: zeroes :length => 0x4
  def zeroes(options = {:length => 0x1})
    check_value 0x00000000, options
  end

  # Example: ffs :length => 0x4
  def ffs(options = {:length => 0x1})
    check_value 0xFFFFFFFF, options
  end

  # Example: check_value 0x00, :length => 0x4
  def check_value(v, options = {:length => 0x1})
    array :initial_length => options[:length] do
      uint32 :check_value => lambda { value == v }
    end
  end
end

