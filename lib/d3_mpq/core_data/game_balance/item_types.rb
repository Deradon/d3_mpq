module D3MPQ::CoreData::GameBalance
  class ItemTypes < BinData::Record
    STRUCT_SIZE = 0x140
    endian :little

    # Padding
    skip  :length => 0x120

    string  :excel_file_name, :length => 0x100
    uint32  :identifier

    # Padding
    hide  :numbers
    array :numbers,
          :type       => :uint32,
          :read_until => lambda { element != 0 && element.offset < 0x370 }

    def data_offset
      numbers.last
    end

    uint32  :data_size

#    array :type => :uint8, :read_until => lambda { element.offset + 0x01 == data_offset + 16 }


    # ItemArray here
    array :content,
          :initial_length => lambda { data_size / STRUCT_SIZE },
          :adjust_offset  => lambda{ data_offset + 16 } do

      # Padding
      zeroes

      # Name
      string  :name,
              :length => 0x100,
              :trim_padding => true

      # Identifier
      uint32  :id
      zeroes
      uint32  :u0
      uint32  :u1
      uint32  :u2
      uint32  :u3
      uint32  :u4
      uint32  :u5
      ffs     :length => 0x2
      uint32  :u6

      # ItemType
      uint32 :type
      uint32 :u7
      uint32 :u8
      uint32 :u9
    end

    hide  :rest
    rest  :rest
  end
end

