module D3MPQ::CoreData::GameBalance
  class SetItemBonuses < Base
    self.struct_size = 0x1D0

    content do
      zeroes
      string  :name,
              :read_length  => 0x100,
              :trim_padding => true

      skip  :length => 0xD0 - 4
    end

    # TODO
    194.times do |i|
      float "fp#{i}".intern
    end

    hide  :rest
    rest  :rest
  end
end

