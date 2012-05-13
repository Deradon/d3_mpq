module D3MPQ::CSVGenerator
  class MonsterAffixes < Base
    MPQ_READER = D3MPQ::CoreData::GameBalance::MonsterAffixes

    map = {
      :name             => :name,
      :name_hash        => Proc.new { |subject| subject.name.to_d3_hash },
      :ui1  => :ui1,
      :ui2  => :ui2,
      :ui3  => :ui3,
      :ui4  => :ui4,
      :ui5  => :ui5,
      :ui6  => :ui6,
      :ui7  => :ui7,
      :ui8  => :ui8,
      :ui9  => :ui9,
    }

    21.times do |i|
      m = "modcode#{i}"
      map["#{m}_mod_id".intern]     = Proc.new { |subject| subject.mod_codes[i].mod_code }
      map["#{m}_param1".intern]     = Proc.new { |subject| subject.mod_codes[i].mod_param1 }
      map["#{m}_param2".intern]     = Proc.new { |subject| subject.mod_codes[i].mod_param2 }
      map["#{m}_param3".intern]     = Proc.new { |subject| subject.mod_codes[i].mod_param3 }
      map["#{m}_opcode".intern]     = Proc.new { |subject| subject.mod_codes[i].trace.join("|") }
      map["#{m}_value_min".intern]  = Proc.new { |subject| subject.mod_codes[i].min }
      map["#{m}_value_max".intern]  = Proc.new { |subject| subject.mod_codes[i].max }
    end
    map = map.merge({
      :ref1 => :ref1,
      :ref2 => :ref2,
      :ref3 => :ref3,
      :ref4 => :ref4
    })

    map_to_csv(map)
  end
end

