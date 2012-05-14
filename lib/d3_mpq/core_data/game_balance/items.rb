# README: http://www.d3inferno.com/Items.gam.html
module D3MPQ::CoreData::GameBalance
  class Items < Base
    self.struct_size = 0x5F0

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

      uint32  :u00

      uint32  :durability_min
      uint32  :durability_delta
      uint32  :base_item_hash
      uint32  :setitem_bonus
      uint32  :salvage_common
      uint32  :salvage_magic
      uint32  :salvage_rare
      uint32  :rare_group_prefix_id
      uint32  :rare_group_suffix_id
      zeroes

      uint32  :u09 #town scroll etc.
      uint32  :u09b

      zeroes  :length => 0x17

      # Damage
      float   :weapong_damage_min
      float   :weapong_damage_delta
      zeroes  :length => 0x15

      # Armor
      float   :armor_min
      float   :armor_delta
      zeroes  :length => 0x2A

      # Speed
      float   :attacks_per_second
      zeroes  :length => 21
      float   :damage_mod_min
      float   :damage_mod_delta
      zeroes  :length => 26

      # Unknown
      uint32  :u10    # Weapons:        30601 = wand; 30599 = bow/crossbow; 30592 = rest
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
#      16.times { |i| mod_code "mod_code_#{i}" }

      # TODO
      uint32  :item_quality

      7.times do |i|
        uint32  "teaches#{i}".intern
      end

      ffs     :length => 3
      uint32  :enhancement

      # Legendary Affixes
      uint32  :affix0_id
      uint32  :affix1_id
      uint32  :affix2_id
      uint32  :affix3_id
      uint32  :affix4_id
      uint32  :affix5_id
      uint32  :affix0_level
      uint32  :affix1_level
      uint32  :affix2_level
      uint32  :affix3_level
      uint32  :affix4_level
      uint32  :affix5_level
      uint32  :affix0_secondary
      uint32  :affix1_secondary
      uint32  :affix2_secondary
      uint32  :affix3_secondary
      uint32  :affix4_secondary
      uint32  :affix5_secondary

      uint32  :gem_type
      uint32  :crafting_mat_tier
      uint32  :crafting_mat_rarity

      zeroes  :length => 1
    end
  end
end

