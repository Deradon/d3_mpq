module D3MPQ::CoreData::GameBalance
  # Helper: ClassMask for ItemType
  class ClassMask < BinData::Record
    endian  :little
    uint32  :class_mask

    def use_bar; (class_mask >> 8) & 1; end
    def use_dh;  (class_mask >> 11) & 1; end
    def use_mon; (class_mask >> 13) & 1; end
    def use_wiz; (class_mask >> 9) & 1; end
    def use_wd;  (class_mask >> 10) & 1; end
  end

  # ItemTypes
  class ItemTypes < Base
    self.struct_size = 0x140

    content do
      zeroes

      # Name
      string  :name, :length => 0x100, :trim_padding => true

      # Identifier
      uint32  :parent_hash        # hash of the parent item type
      zeroes

      # Class Mask
      class_mask  :class_mask
        # Byte 1
#        bit1  :is_socketable
#        bit1  :bit02
#        bit2  :check_value => 0
#        bit1  :is_gem
#        bit1  :check_value => 0
#        bit1  :bit07      # follower?
#        bit1  :bit08

#        # Byte 2
#        bit1  :bit09
#        bit1  :bit10
#        bit1  :monk
#        bit1  :bit12
#        bit1  :demon_hunter
#        bit1  :witch_doctor
#        bit1  :wizard
#        bit1  :barbarian

#        # Byte 3-4
#        bit8 :byte3#:check_value => 0
#        bit8 :byte4

      uint32  :item_slot_1
      uint32  :item_slot_2
      uint32  :item_slot_3
      uint32  :item_slot_4

      ffs     :length => 0x3

      uint32  :affix_group_hash

      uint32 :bitmask1
      uint32 :bitmask2
      uint32 :bitmask3
      uint32 :bitmask4
    end
  end
end

