require 'spec_helper'

describe D3MPQ::CSVGenerator::MonsterLevels do
  let(:dir) { "spec/fixtures/CoreData/GameBalance/MonsterLevels.gam" }

  specify "#write" do
    subject.files = dir
    subject.write
  end
end

