module D3MPQ::CSVGenerator
  class MonsterLevels < Base
    MPQ_READER = D3MPQ::CoreData::GameBalance::MonsterLevels

    map = {}

    135.times do |i|
      map["fp_a_#{i}".intern] = "fp_a_#{i}".intern
    end

    map_to_csv(map)
  end
end

