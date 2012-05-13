require 'spec_helper'

describe D3MPQ::CSVGenerator::MonsterNames do
  let(:dir) { "spec/fixtures/CoreData/GameBalance/MonsterNames.gam" }

  specify "#write" do
    subject.files = dir
    subject.write
  end
end

