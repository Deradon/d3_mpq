module D3MPQ::CSVGenerator
  class AffixList < Base
    MPQ_READER = D3MPQ::CoreData::GameBalance::AffixList

    map = {
      :name               => :name,
      :hash               => Proc.new { |subject| subject.name.to_d3_hash },
      :lvl                => :alvl,
      :supmask            => :sup_mask,
      :param1             => :param1,
      :param2             => :param2,
      :rare_prefix_fileid => :rare_name_prefix_id,
      :rate_suffix_fileid => :rare_name_suffix_id,
      :parent_hash        => :group_hash,
      :parent_hash2       => :group_hash2,
      :class_id           => :class_id,
      :resource_hash      => :resource_type_hash,
      :quality_mask       => :quality_mask,
      :socket_mask        => :socket_mask,
      :primary_group_hash => :primary_group_hash
    }

    32.times do |i|
      map["itemgroup_hash#{i}".intern] = "igh#{i}".intern
    end

    4.times do |i|
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

