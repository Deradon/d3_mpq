module D3MPQ::CoreData::GameBalance
  class MonsterAffixes < Base
    self.struct_size = 0x318

    content do
      zeroes
      string  :name,
              :read_length  => 0x100,
              :trim_padding => true

      uint32  :ui1
      uint32  :ui2
      uint32  :ui3
      uint32  :ui4
      uint32  :ui5

      # TODO
      skip    :length => 0x210 - 16
    end

    hide  :rest
    rest  :rest
  end
end

