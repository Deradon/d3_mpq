module D3MPQ::CSVGenerator
  class ExperienceTable < Base
    MPQ_READER = D3MPQ::CoreData::GameBalance::ExperienceTable

    map = [
      :xp1,
      :fp1,
      :xp_given_1,
      :xp_given_2,
      :xp_given_3,
      :xp_given_4,
      :xp_given_5,
      :ui1,
      :ui2,
      :ui3,
      :ui4,
      :ui5,
      :ui1a,
      :ui2a,
      :ui3a,
      :ui4a,
      :ui5a
    ]

    40.times do |i|
      map << "u#{i}".intern
    end

    map_to_csv(map)
  end
end

