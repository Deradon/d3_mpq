require 'spec_helper'

describe D3MPQ::StringList do
  let(:io) { File.open("spec/fixtures/StringList/ItemSets.stl") }

  before(:all) do
    subject.read(io)
#    BinData::trace_reading { subject.read(io) }
  end

  its(:content) { should be_a_kind_of(BinData::Array) }
  its(:rest) { should == "" }
end

