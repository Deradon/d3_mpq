require 'spec_helper'

describe D3MPQ::CoreData::GameBalance::AffixList do
  let(:io) { File.open("spec/fixtures/CoreData/GameBalance/AffixList.gam") }

  before(:all) do
    subject.read(io)
#    BinData::trace_reading { subject.read(io) }
  end

  its(:variable_content) { subject.size.should_not == 0 }
  its(:rest) { should == "" }
end

