require 'spec_helper'

describe D3MPQ::CSVGenerator do
  let(:dir) { "spec/fixtures/StringList" }
  subject { D3MPQ::CSVGenerator::StringList.new }

  describe "#files" do
    context "when called with dir" do
      specify do
        subject.files = dir
        subject.files.count.should > 500
      end
    end
  end

  describe "#write" do
    let(:entries) { Dir.open(dir).entries[0,10].map { |e| "spec/fixtures/StringList/#{e}" } }
    let(:generator) { D3MPQ::CSVGenerator::StringList.new(entries) }

    specify { generator.write }
  end
end

