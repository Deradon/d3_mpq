require 'spec_helper'

describe D3MPQ::Analyzer, :integration => true do
  game_balance = "spec/fixtures/CoreData/GameBalance/"

  items = [
    "Items_Armor.gam",
    "Items_Legendary.gam",
    "Items_Legendary_Other.gam",
    "Items_Legendary_Weapons.gam",
    "Items_Other.gam",
    "Items_Quests_Beta.gam",
    "Items_Weapons.gam"
  ].map!{ |item| "#{game_balance}#{item}" }

  {
    D3MPQ::CoreData::GameBalance::ItemTypes       => "#{game_balance}ItemTypes.gam",
    D3MPQ::CoreData::GameBalance::ExperienceTable => "#{game_balance}ExperienceTable.gam",
    D3MPQ::CoreData::GameBalance::Items           => items

  }.each do |parser, file|
    describe "Analyzer for '#{parser.to_s}'#{file}" do
      subject { D3MPQ::Analyzer.new(parser, file) }
      its(:attributes) { should be_kind_of(Hash) }
      specify { expect { subject.write }.to_not raise_error }
    end
  end
end

