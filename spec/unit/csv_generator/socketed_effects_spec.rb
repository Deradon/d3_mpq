require 'spec_helper'

describe D3MPQ::CSVGenerator::SocketedEffects do
  let(:dir) { "spec/fixtures/CoreData/GameBalance/SocketedEffects.gam" }

  specify "#write" do
    subject.files = dir
    subject.write
  end
end

