require 'spec_helper'

describe D3MPQ::CoreData::GameBalance::AffixList do
  let(:io) { File.open("spec/fixtures/CoreData/GameBalance/AffixList.gam") }

  before(:all) do
    subject.read(io)
#    BinData::trace_reading { subject.read(io) }
  end

  its(:variable_content) { subject.size.should_not == 0 }
  its(:rest) { should == "" }

  describe "content#mod_codes" do
    let(:mod_codes) { subject.content.first.mod_codes }

    specify { mod_codes.should be_kind_of(ModCodes) }
  end
end

