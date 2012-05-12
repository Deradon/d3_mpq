require 'spec_helper'

describe D3MPQ::CSVGenerator::ItemTypes do
  let(:dir) { "spec/fixtures/CoreData/GameBalance/ItemTypes.gam" }

  specify "#write" do
    subject.files = dir
    subject.write
  end
end

