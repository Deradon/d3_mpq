module D3MPQ::CSVGenerator
  class SocketedEffects < Base
    MPQ_READER = D3MPQ::CoreData::GameBalance::SocketedEffects

    map = {
      :name           => :name,
      :hash           => Proc.new { |subject| subject.name.to_d3_hash },
      :item_hash      => :item_hash,
      :item_type_hash => :item_type_hash,
      :nls_key        => :nls_key
    }

    5.times do |i|
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

