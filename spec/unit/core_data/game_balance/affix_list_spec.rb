require 'spec_helper'

describe D3MPQ::CoreData::GameBalance::AffixList do
  let(:io) { File.open("spec/fixtures/CoreData/GameBalance/AffixList.gam") }
  let(:mod_codes) { subject.content.first.mod_codes }

  before(:all) do
    subject.read(io)
#    BinData::trace_reading { subject.read(io) }
  end

  its(:variable_content) { subject.size.should_not == 0 }
  its(:rest) { should == "" }

  describe "content#mod_codes" do
    specify { mod_codes.should be_kind_of(D3MPQ::ModCodes) }
  end
end

