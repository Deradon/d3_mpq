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
      uint32  :ui6
      uint32  :ui7
      uint32  :ui8
      uint32  :ui9

      mod_codes :mod_codes, :initial_length => 20

      uint32 :ref1
      uint32 :ref2
      uint32 :ref3
      uint32 :ref4

    end
  end
end

