module D3MPQ::CSVGenerator
  class Items < Base
    MPQ_READER = D3MPQ::CoreData::GameBalance::Items

    map = {
      :name               => :name,
      :hash               => Proc.new { |subject| subject.name.to_d3_hash },
      :actor_id           => :actor_id,
      :item_type_hash     => :item_type_hash,
      :lvl                => :item_level,
      :lvl2               => :ilvl2,
      :random_affixes     => :num_random_affixes,
      :max_sockets        => :num_sockets,
      :max_stacksize      => :stack_size,
      :gold_price         => :gold_value,
      :clvl               => :required_level,
      :durability_min     => :durability_min,
      :durability_delta   => :durability_delta,
      :baseitem_hash      => :base_item_hash,
      :setitem_bonus      => :setitem_bonus,
      :salvage_common     => :salvage_common,
      :salvage_magic      => :salvage_magic,
      :salvage_rare       => :salvage_rare,
      :rare_prefix_fileid => :rare_group_prefix_id,
      :rare_suffix_fileid => :rare_group_suffix_id,
      :damage_min         => :weapong_damage_min,
      :damage_delta       => :weapong_damage_delta,
      :armor_min          => :armor_min,
      :armor_delta        => :armor_delta,
      :weapon_speed       => :attacks_per_second,
      :damagemod_min      => :damage_mod_min,
      :damagemod_delta    => :damage_mod_delta,
      :item_quality       => :item_quality,
      :enhancement        => :enhancement,
      :gem_type           => :gem_type,
      :craftmat_tier      => :crafting_mat_tier,
      :craftmat_rarity    => :crafting_mat_rarity
    }

    7.times do |i|
      t = "teaches#{i}".intern
      map[t] = t
    end

    6.times do |i|
      map["affixgroup#{i}".intern] = "affix#{i}_id".intern
      map["affixlevel#{i}".intern] = "affix#{i}_level".intern
    end

    16.times do |i|
      m = "modcode#{i}"
      map["#{m}_mod_id".intern]     = Proc.new { |subject| subject.mod_codes[i].mod_code }
      map["#{m}_param1".intern]     = Proc.new { |subject| subject.mod_codes[i].mod_param1 }
      map["#{m}_param2".intern]     = Proc.new { |subject| subject.mod_codes[i].mod_param2 }
      map["#{m}_param3".intern]     = Proc.new { |subject| subject.mod_codes[i].mod_param3 }
      map["#{m}_opcode".intern]     = Proc.new { |subject| subject.mod_codes[i].trace.join("|") }
      map["#{m}_value_min".intern]  = Proc.new { |subject| subject.mod_codes[i].min }
      map["#{m}_value_max".intern]  = Proc.new { |subject| subject.mod_codes[i].max }
    end

    map_to_csv(map)
  end
end

