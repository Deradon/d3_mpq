require 'spec_helper'

describe D3MPQ::CoreData::GameBalance::ItemTypes do
  let(:io) { File.open("spec/fixtures/CoreData/GameBalance/ItemTypes.gam") }

  before(:all) do
#    subject.read(io)
    BinData::trace_reading { subject.read(io) }
  end

#  specify do
#    p subject.content.last
#    pending
#  end

  its(:rest) { should == "" }
end

