require 'spec_helper'

describe D3MPQ::CSVGenerator::ExperienceTable do
  let(:dir) { "spec/fixtures/CoreData/GameBalance/ExperienceTable.gam" }

  specify "#write" do
    subject.files = dir
    subject.write
  end
end

