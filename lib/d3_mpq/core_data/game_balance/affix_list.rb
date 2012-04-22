module D3MPQ::CoreData::GameBalance
  class AffixList < Base#BinData::Record
    self.struct_size = 0x218

    content do
      zeroes

      string  :name,
              :read_length  => 0x100,
              :trim_padding => true

      uint32  :gold_value
      uint32  :min_level
      uint32  :seven_oh
      uint32  :int1
      uint32  :min_level_plus_x

      zeroes

      uint32    :int2
      uint32    :int3
      uint32be  :ref1
      uint32be  :ref2
      uint32be  :ref3
      uint32be  :ref4
      uint32be  :ref5

      ffs :length => 5

      uint32be  :ref6
      uint32be  :ref7
      uint32be  :ref8
      uint32be  :ref9
      uint32be  :ref10
      uint32be  :ref11
      uint32be  :ref12
      uint32be  :ref13
      uint32be  :ref14

      array :internal_refs, :initial_length => 0x04 do
        uint32  :int1
        uint32  :int2
        zeroes  :length => 2
        uint32  :internal_ref_offset
        uint32  :internal_ref_length
      end

      zeroes  :length => 18
    end
  end
end

