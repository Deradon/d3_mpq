require 'spec_helper'

describe D3MPQ::CoreData::GameBalance::LabelsGlobal do
  let(:io) { File.open("spec/fixtures/CoreData/GameBalance/LabelsGlobal.gam") }

  before(:all) do
    subject.read(io)
#    BinData::trace_reading { subject.read(io) }
  end

  its(:rest) { should == "" }
end

