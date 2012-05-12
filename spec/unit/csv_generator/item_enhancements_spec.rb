require 'spec_helper'

describe D3MPQ::CSVGenerator::ItemEnhancements do
  let(:dir) { "spec/fixtures/CoreData/GameBalance/ItemEnhancements.gam" }

  specify "#write" do
    subject.files = dir
    subject.write
  end
end

