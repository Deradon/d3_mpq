module D3MPQ::CoreData::GameBalance
  class ItemDropTable < Base
    self.struct_size = 0x474

    content do
      zeroes

      string  :name,
              :read_length  => 0x100,
              :trim_padding => true

      # lot of ints
      220.times do |i|
        uint32  "ui#{i}".intern
      end

      # TODO
      # skip  :length => 0x370
    end

    hide  :rest
    rest  :rest
  end
end

