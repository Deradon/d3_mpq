require 'spec_helper'

# Run IntegrationTest against MPQ
describe D3MPQ::CoreData::Actor, :integration => true do
  parser = D3MPQ::CoreData::Actor

  actor_path = "spec/fixtures/CoreData/Actor/"

  dir = Dir.open(actor_path)
  actors = dir.entries
  actors = actors.delete_if{ |e| e == "." || e == ".."}
  actors = actors.map{ |a| "#{actor_path}#{a}" }

  specify "Analyzer for D3MPQ::CoreData::Actor" do
    actors.delete_if do |a|
      temp_file = File.new(a)
      size = temp_file.size
      temp_file.close

      if size == 0
        warn "[SKIP] #{a}"
        true
      else
        false
      end
    end

    parser = D3MPQ::Analyzer.new(parser, actors, nil)
    parser.write
  end
end

