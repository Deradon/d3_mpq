require 'spec_helper'

describe D3MPQ::CSVGenerator::AffixList do
  let(:dir) { "spec/fixtures/CoreData/GameBalance/AffixList.gam" }

  specify "#write" do
    subject.files = dir
    subject.write
  end
end

