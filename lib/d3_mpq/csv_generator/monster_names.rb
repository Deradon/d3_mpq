module D3MPQ::CSVGenerator
  class MonsterNames < Base
    MPQ_READER = D3MPQ::CoreData::GameBalance::MonsterNames

    map = {
      :affix_name       => :affix_name,
      :affix_name_hash  => Proc.new { |subject| subject.affix_name.to_d3_hash },
      :is_suffix        => :is_suffix,
      :name             => :name,
      :name_hash        => Proc.new { |subject| subject.name.to_d3_hash }
    }

    map_to_csv(map)
  end
end

