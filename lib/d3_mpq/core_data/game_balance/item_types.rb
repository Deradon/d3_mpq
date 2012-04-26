module D3MPQ::CoreData::GameBalance
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
        # Byte 1
        bit1  :is_socketable
        bit1  :bit02
        bit2  :check_value => 0
        bit1  :is_gem
        bit1  :check_value => 0
        bit1  :bit07      # follower?
        bit1  :bit08

        # Byte 2
        bit1  :bit09
        bit1  :bit10
        bit1  :monk
        bit1  :bit12
        bit1  :demon_hunter
        bit1  :witch_doctor
        bit1  :wizard
        bit1  :barbarian

        # Byte 3-4
        bit8 :byte3#:check_value => 0
        bit8 :byte4

      #Character
      #03: Off-Hand
      #04: Main-Hand
      #01: Head
      #02: Torso
      #05: Hands
      #06: Belt
      #07: Feet
      #08: Shoulders
      #09: Legs
      #0A: Wrists
      #0B: Finger (1)
      #0C: Finger (2)
      #0D: Neck
      #Follower
      #15: Off-Hand
      #16: Main-Hand
      #17: Follower Special
      #19: Finger (1)
      #1A: Finger (2)
      #18: Neck
      uint32  :item_slot_1
      uint32  :item_slot_2
      uint32  :item_slot_3
      uint32  :item_slot_4

      ffs     :length => 0x3

      uint32  :affix_group_hash

      # ItemType
#      uint32 :bit_mask_1
#      uint32 :bit_mask_2
#      uint32 :bit_mask_3
#      uint32 :bit_mask_4
      128.times do |i|
        bit1  "bit_#{i}".intern
      end
    end
  end
end

