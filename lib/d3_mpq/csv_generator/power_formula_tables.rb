module D3MPQ::CSVGenerator
  class PowerFormulaTables < Base
    MPQ_READER = D3MPQ::CoreData::GameBalance::PowerFormulaTables

    map = {
      :name           => :name,
      :hash           => Proc.new { |subject| subject.name.to_d3_hash }
    }

    61.times do |i|
      map["level_#{i}".intern]  = "level_#{i}".intern
    end

    map_to_csv(map)
  end
end

