require 'spec_helper'

describe D3MPQ::CSVGenerator::RareNames do
  let(:dir) { "spec/fixtures/CoreData/GameBalance/RareNames.gam" }

  specify "#write" do
    subject.files = dir
    subject.write
  end
end

