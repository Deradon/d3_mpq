require 'spec_helper'

describe D3MPQ::StringList do
  #let(:io) { File.open("spec/fixtures/StringList/Conv_Hireling_Greetings_Farwells.stl") }
  let(:io) { File.open("spec/fixtures/StringList/Bnet_Login.stl") }

  before(:all) do
    subject.read(io)
#    BinData::trace_reading { subject.read(io) }
  end

  its(:content) { should be_a_kind_of(BinData::Array) }
  specify { subject.rest.length.should == 0 }
end

