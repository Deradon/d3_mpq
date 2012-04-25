module D3MPQ::CoreData::GameBalance
  class ItemEnhancements < Base
    self.struct_size = 0x2B8

    content do
      zeroes

      string  :name,
              :read_length  => 0x100,
              :trim_padding => true

      zeroes

      # lot of ints
      103.times do |i|
        uint32  "ui#{i}".intern
      end

      zeroes  :length => 5
    end
  end
end

