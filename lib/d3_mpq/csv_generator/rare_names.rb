module D3MPQ::CSVGenerator
  class RareNames < Base
    MPQ_READER = D3MPQ::CoreData::GameBalance::RareNames

    map = {
      :name         => :name,
      :hash         => Proc.new { |subject| subject.name.to_d3_hash },
      :unknown      => :unknown,
      :stl_key_hash => :stl_key_hash
    }

    map_to_csv(map)
  end
end

