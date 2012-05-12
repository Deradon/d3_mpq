class String
  def to_d3_hash
    self.each_char.inject(0) { |h, c| ((h * 0x21) + c.downcase.ord) & 0xFFFFFFFF }
  end
end

