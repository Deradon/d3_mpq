require 'spec_helper'

describe D3MPQ::ModCodeAnalyzer, :integration => true do
  game_balance = "spec/fixtures/CoreData/GameBalance/"

  items = [
    "Items_Armor.gam",
#    "Items_Legendary.gam",
#    "Items_Legendary_Other.gam",
#    "Items_Legendary_Weapons.gam",
    "Items_Other.gam",
    "Items_Quests_Beta.gam",
    "Items_Weapons.gam"
  ].map!{ |item| "#{game_balance}#{item}" }

  {
    D3MPQ::CoreData::GameBalance::AffixList => "#{game_balance}AffixList.gam"
  }.each do |parser, file|
    context "mod_code_affixes" do
      subject { D3MPQ::ModCodeAnalyzer.new(parser, file, "mod_code_affixes") }
      specify { expect { subject.write }.to_not raise_error }
    end
  end

  {
    D3MPQ::CoreData::GameBalance::Items => items
  }.each do |parser, file|
    context "mod_code_items" do
      subject { D3MPQ::ModCodeAnalyzer.new(parser, file, "mod_code_items") }
      specify { expect { subject.write }.to_not raise_error }
    end
  end
end

