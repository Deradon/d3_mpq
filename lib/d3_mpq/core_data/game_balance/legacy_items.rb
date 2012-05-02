# README: http://www.d3inferno.com/Items.gam.html

# Support for old / removed Legendary Items from MPQ
module D3MPQ::CoreData::GameBalance
  class LegacyItems < Base
    self.struct_size = 0x590

    content do
      zeroes

      # Name
      string  :name, :length => 0x100, :trim_padding => true

      uint32  :actor_id
      uint32  :item_type_hash

      # Flags
      bit1    :_f00 # 0x0 = armor ?
      bit1    :is_easter_egg
      bit1    :is_nephalem_cube
      bit1    :bit_c2
      bit1    :check_value => 0x0
      bit1    :is_quest2
      bit1    :_f01         # UniqueAmuletPvP && Co
      bit1    :is_uniq
      bit24   :check_value => 0x0


      zeroes

      uint32  :item_level

      zeroes  :length => 0x2

      uint32  :num_random_affixes
      uint32  :num_sockets
      uint32  :stack_size
      uint32  :gold_value
      uint32  :ilvl2
      uint32  :required_level

      uint32  :durability_min
      uint32  :durability_delta
      uint32  :base_item_hash


      ### Do not rely on the data below ###
        uint32  :set_item_bonusses
        uint32  :salvage_common
        uint32  :salvage_magic
        uint32  :salvage_rage

        uint32  :rare_group_prefix_id
        # uint32  :rare_group_suffix_id
      #####################################


      zeroes

      uint32  :u09 #town scroll etc.

      zeroes  :length => 0x18

      # Damage
      float   :weapong_damage_min
      float   :weapong_damage_delta
      zeroes  :length => 0x15

      # Armor
      float   :armor_minimum
      float   :armor_variable
      zeroes  :length => 0x2A

      # Speed
      float   :attacks_per_second
      zeroes  :length => 0x28

      # Unknown
      uint32    :u10    # Weapons:        30601 = wand; 30599 = bow/crossbow; 30592 = rest
                        # non-weapongs:   0xFF

      # Padding
      zeroes
      ffs
      zeroes
      ffs
      zeroes
      ffs
      zeroes  :length => 12

      mod_codes :mod_codes, :initial_length => 16
      uint32    :item_quality

      # TODO
      uint32  :u11
      uint32  :u12   # none 0 x FF FF FF FF if Recipe

      ffs     :length => 6

      # Legendary Affixes
      uint32  :affix1_id
      uint32  :affix2_id
      uint32  :affix3_id
      uint32  :affix4_id
      uint32  :affix5_id
      ffs
      uint32  :affix1_level
      uint32  :affix2_level
      uint32  :affix3_level
      uint32  :affix4_level
      uint32  :affix5_level

      zeroes
    end
  end
end

