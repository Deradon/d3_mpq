require 'spec_helper'

describe D3MPQ::CSVGenerator::SetItemBonuses do
  let(:dir) { "spec/fixtures/CoreData/GameBalance/SetItemBonuses.gam" }

  specify "#write" do
    subject.files = dir
    subject.write
  end
end

