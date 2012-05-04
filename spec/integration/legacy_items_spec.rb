require 'spec_helper'

describe D3MPQ::CoreData::GameBalance::LegacyItems, :integration => true do
  let(:base_path) { "spec/fixtures/Legacy/" }

  [
    "Items_Legendary.gam",
    "Items_Legendary_Other.gam",
    "Items_Legendary_Weapons.gam",
  ].each do |item|
    specify(item) do
      io = File.open("#{base_path}#{item}")
      subject.read(io)
      subject.rest.should == ""
    end
  end
end

