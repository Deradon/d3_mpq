require 'spec_helper'

describe D3MPQ::CoreData::GameBalance::Items, :integration => true do
  let(:base_path) { "spec/fixtures/CoreData/GameBalance/" }

  items = [
    "Items_Armor.gam",
#    "Items_Legendary.gam",
#    "Items_Legendary_Other.gam",
#    "Items_Legendary_Weapons.gam",
    "Items_Other.gam",
    "Items_Quests_Beta.gam",
    "Items_Weapons.gam"
  ].each do |item|
    specify(item) do
      io = File.open("#{base_path}#{item}")
      subject.read(io)
      subject.rest.should == ""
    end
  end
end

