require 'spec_helper'

describe D3MPQ::CSVGenerator::StringList do
  let(:dir) { "spec/fixtures/StringList" }
  let(:entries) { Dir.open(dir).entries[0,10].map { |e| "spec/fixtures/StringList/#{e}" } }

  specify "#write" do
    subject.files = entries
    subject.write
  end
end

