require 'spec_helper'

describe D3MPQ::CoreData::GameBalance::MonsterAffixes, :broken => true do
  let(:io) { File.open("spec/fixtures/CoreData/GameBalance/MonsterAffixes.gam") }

  before(:all) do
#    subject.read(io)
    BinData::trace_reading { subject.read(io) }
  end

  its(:rest) { should == "" }
end

