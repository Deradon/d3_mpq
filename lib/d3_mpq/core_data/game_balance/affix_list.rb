module D3MPQ::CoreData::GameBalance
  class AffixList < BinData::Record
    STRUCT_SIZE = 0x218

    endian :little
    hide   :numbers

    # File Header
    skip    :length => 0x120
    string  :excel_file_name, :length => 0x100
    uint32  :identifier
    array   :numbers, :type => :uint32, :read_until => lambda { element != 0 && element.offset < 0x370 }
    uint32  :data_size
    array   :type => :uint8, :read_until => lambda { element.offset + 0x01 == data_offset + 16  }

    def data_offset
      self.numbers.last
    end


    # ContentArray
    array :data_content, :initial_length => lambda { data_size / STRUCT_SIZE } do
      uint32  :check_value => lambda { value == 0x00 }

      #TODO desc
      string  :name, :read_length => 0x100, :trim_padding => true
      uint32  :gold_value
      uint32  :min_level
      uint32  :seven_oh
      uint32  :int1
      uint32  :min_level_plus_x
      uint32  :check_value => lambda { value == 0x00 }
      uint32  :int2
      uint32  :int3
      uint32be  :ref1
      uint32be  :ref2
      uint32be  :ref3
      uint32be  :ref4
      uint32be  :ref5

      # 0x14 FF padding
      array :initial_length => 0x14 do
        uint8 :check_value => lambda { value == 0xFF }
      end

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
        uint32  :check_value => lambda { value == 0x00 }
        uint32  :check_value => lambda { value == 0x00 }
        uint32  :internal_ref_offset
        uint32  :internal_ref_length
      end

      array :initial_length => 0x48 do
        uint8 :check_value => lambda { value == 0x00 }
      end
    end
  end
end

