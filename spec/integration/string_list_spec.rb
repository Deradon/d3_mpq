require 'spec_helper'

# Run IntegrationTest against MPQ
describe D3MPQ::StringList, :integration => true do
  parser = D3MPQ::StringList

  dir = Dir.open("spec/fixtures/StringList/")
  dir.entries.each do |f|
    next if f == "." || f == ".." ||

    file = File.join(dir, f)

    temp_file = File.new(file)
    size = temp_file.size
    temp_file.close

    if size == 0
      warn "[EMPTY FILE]#{f}"
      next
    end



    describe "Analyzer for #{parser.to_s}##{file}" do
      subject { D3MPQ::Analyzer.new(parser, file) }
      specify { expect { subject.write }.to_not raise_error }
    end
  end
end

