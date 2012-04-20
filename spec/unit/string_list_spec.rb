require 'spec_helper'

describe D3MPQ::StringList do
  let(:item_sets) { File.open("spec/fixtures/StringList/ItemSets.stl") }

  before(:all) do
    subject.read(item_sets)
  end

  its(:items) { should be_a_kind_of(BinData::Array) }
  specify { subject.items.count.should == 18 }
end

