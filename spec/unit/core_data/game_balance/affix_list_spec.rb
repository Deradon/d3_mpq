require 'spec_helper'

describe D3MPQ::CoreData::GameBalance::AffixList do
  let(:io) { File.open("spec/fixtures/CoreData/GameBalance/AffixList.gam") }

  before(:all) do
    subject.read(io)
#    BinData::trace_reading { subject.read(io) }
  end

  specify do
    pending
  end
end

