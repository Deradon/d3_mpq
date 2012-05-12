require 'spec_helper'

describe D3MPQ::Recipe do
  let(:io) { File.open("spec/fixtures/Recipe/T01_Armor_Belt.rcp") }

  before(:all) do
    subject.read(io)
#    BinData::trace_reading { subject.read(io) }
  end

  specify { subject.rest.length.should == 0 }
end

