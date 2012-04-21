module D3MPQ::CoreData::GameBalance
  class Items < BinData::Record
    STRUCT_SIZE = 0x590
    endian :little

    # HIDE
    hide  :zero, :item_level_plus_one

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
      string  :name,:length => 0x100, :trim_padding => true

      # Identifier
      uint32 :item_identifier
      uint32 :ref1

      # ItemType
      uint32 :item_type

      zeroes


      uint32 :item_level_plus_one

      zeroes :length => 0x2

      uint32 :u01
      uint32 :u02
      uint32 :u03
      uint32 :gold_value
      uint32 :item_level_plus_one_times_three
      uint32 :required_level
      uint32 :two_five_oh
      uint32 :two_oh_oh
      uint32 :ref2
      uint32 :u04
      uint32 :u05
      uint32 :u06
      uint32 :u07
      uint32 :u08

      zeroes

      uint32  :u09 #town scroll etc.

      zeroes  :length => 0x18

      # Damage
      float_le  :damage_minimum
      float_le  :damage_variable
      zeroes    :length => 0x15

      # Armor
      float_le  :armor_minimum
      float_le  :armor_variable
      zeroes    :length => 0x2A

      # Speed
      float_le  :speed
      zeroes    :length => 0x28

      # Unknown
      uint32    :u10

      # Padding
      zeroes
      ffs
      zeroes
      ffs
      zeroes
      ffs
      zeroes  :length => 0x6

      # TODO
      string   :length => 0x1bc

      uint32be :affix1_ref
      uint32be :affix2_ref
      uint32be :affix3_ref
      uint32be :affix4_ref
      uint32be :affix5_ref

      ffs

      uint32   :affix1_value
      uint32   :affix2_value
      uint32   :affix3_value
      uint32   :affix4_value
      uint32   :affix5_value

      zeroes
    end

    hide  :rest
    rest  :rest
  end
end

