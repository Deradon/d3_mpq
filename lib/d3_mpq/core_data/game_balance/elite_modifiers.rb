module D3MPQ::CoreData::GameBalance
  class EliteModifiers < Base
    self.struct_size = 0x158

    content do
      zeroes

      string  :name,
              :read_length  => 0x100,
              :trim_padding => true

      float   :fp0
      uint32  :ui0

      float   :fp1
      uint32  :ui1

      float   :fp2
      uint32  :ui2

      float   :fp3
      uint32  :ui3

      float   :fp4
      uint32  :ui4

      float   :fp5
      uint32  :ui5

      float   :fp6
      uint32  :ui6

      float   :fp7
      uint32  :ui7

      uint32  :ui8
      float   :fp8

      uint32  :ui9
      float   :fp9

      float   :fp10
    end
  end
end

