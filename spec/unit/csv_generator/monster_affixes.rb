require 'spec_helper'

describe D3MPQ::CSVGenerator::MonsterAffixes do
  let(:dir) { "spec/fixtures/CoreData/GameBalance/MonsterAffixes.gam" }

  specify "#write" do
    subject.files = dir
    subject.write
  end
end

