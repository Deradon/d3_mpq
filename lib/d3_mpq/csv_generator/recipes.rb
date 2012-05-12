module D3MPQ::CSVGenerator
  class Recipes < Base
    MPQ_READER = D3MPQ::CoreData::GameBalance::Recipes

    map = {
      :name           => :name,
      :hash           => Proc.new { |subject| subject.name.to_d3_hash },
      :rcp_id         => :rcp_id,
      :type           => :type,
      :source         => :source,
      :gold_cost      => :gold_cost,
      :level_internal => :level_internal,
      :num_mats       => :unkown
    }

    6.times do |i|
      map["mats#{i}_hash".intern] = "mats#{i}_hash".intern
      map["mats#{i}_num".intern]  = "mats#{i}_num".intern
    end

    map_to_csv(map)
  end
end

