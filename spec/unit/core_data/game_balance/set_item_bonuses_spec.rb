require 'spec_helper'

describe D3MPQ::CoreData::GameBalance::SetItemBonuses do
  let(:io) { File.open("spec/fixtures/CoreData/GameBalance/SetItemBonuses.gam") }

  before(:all) do
    subject.read(io)
#    BinData::trace_reading { subject.read(io) }
  end

  # TODO
  its(:rest) { should_not == "" }
end

