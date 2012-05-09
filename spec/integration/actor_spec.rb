require 'spec_helper'

# Run IntegrationTest against MPQ
describe D3MPQ::CoreData::Actor, :integration => true do
  parser = D3MPQ::CoreData::Actor

  actor_path = "spec/fixtures/CoreData/Actor/"



  dir = Dir.open(actor_path)
  actors = dir.entries
  actors = actors.delete_if{ |e| e == "." || e == ".."}
  actors = actors.map{ |a| "#{actor_path}#{a}" }


#  dir.entries.sort.each do |f|
#    next if f == "." || f == ".."


#    file = File.join(dir, f)

#    temp_file = File.new(file)
#    size = temp_file.size
#    temp_file.close

#    if size == 0
#      warn "[EMPTY FILE]#{f}"
#      next
#    end

    describe "Analyzer for #{parser.to_s}#" do
      subject { D3MPQ::Analyzer.new(parser, actors, nil) }
      specify { subject.write }

#      specify do
#        BinData::trace_reading { parser.read(File.open(file)) }
#      end
    end
#  end
end

