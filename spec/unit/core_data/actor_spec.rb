require 'spec_helper'

describe D3MPQ::CoreData::Actor do
  let(:io) { File.open("spec/fixtures/CoreData/Actor/DH_elementalArrow_iceProjectile.acr") }
#  let(:io) { File.open("spec/fixtures/CoreData/GameBalance/Items_Quests_Beta.gam") }

#  before(:all) do
#    subject.read(io)
##    BinData::trace_reading { subject.read(io) }
#  end

  specify do
    BinData::trace_reading { subject.read(io) }
#    subject.var_data_length.should == 0
    subject.rest.length.should == 0
    true.should be_false
  end

#  its(:variable_content) { subject.size.should_not == 0 }
#  its(:rest) { should == "" }
end

