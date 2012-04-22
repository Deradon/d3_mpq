require 'spec_helper'

describe D3MPQ::CoreData::GameBalance::ItemDropTable do
  let(:io) { File.open("spec/fixtures/CoreData/GameBalance/ItemDropTable.gam") }

  before(:all) do
    subject.read(io)
#    BinData::trace_reading { subject.read(io) }
  end

  its(:rest) { should == "" }
end

