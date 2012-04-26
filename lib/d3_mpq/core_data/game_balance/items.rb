# README: http://www.d3inferno.com/Items.gam.html
module D3MPQ::CoreData::GameBalance
  class Items < Base
    self.struct_size = 0x5F0#0x590

    # Returns a test instance
    def self.test
      io = File.open("spec/fixtures/CoreData/GameBalance/Items_Armor.gam")
      subject = self.new
      subject.read(io)

      return subject
    end

    content do
      zeroes

      # Name
      string  :name,:length => 0x100, :trim_padding => true

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
      uint32  :set_item_bonusses
      uint32  :salvage_common
      uint32  :salvage_magic
      uint32  :salvage_rage
      uint32  :rare_group_prefix_id
      uint32  :rare_group_suffix_id
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
      zeroes  :length => 21
      float   :min_damage_mod
      float   :max_damage_mod
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
      uint32  :enchants

      # Legendary Affixes
      uint32  :affix1_ref
      uint32  :affix2_ref
      uint32  :affix3_ref
      uint32  :affix4_ref
      uint32  :affix5_ref
      ffs
      uint32  :affix1_level
      uint32  :affix2_level
      uint32  :affix3_level
      uint32  :affix4_level
      uint32  :affix5_level

      zeroes

      uint32  :gem_type
      uint32  :crafting_mat_tier
      uint32  :crafting_mat_rarity
      zeroes  :length => 3
      uint32  :ui_others_0
      uint32  :ui_others_1
      uint32  :ui_others_2
      zeroes  :length => 1
    end
  end
end

