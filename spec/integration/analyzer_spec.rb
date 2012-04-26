require 'spec_helper'

describe D3MPQ::Analyzer, :integration => true do
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

  # Parse content only
  {
    D3MPQ::CoreData::GameBalance::AffixList         => "#{game_balance}AffixList.gam",
    D3MPQ::CoreData::GameBalance::ItemTypes         => "#{game_balance}ItemTypes.gam",
    D3MPQ::CoreData::GameBalance::ExperienceTable   => "#{game_balance}ExperienceTable.gam",
#    D3MPQ::CoreData::GameBalance::EliteModifiers    => "#{game_balance}EliteModifiers.gam",
#    D3MPQ::CoreData::GameBalance::ItemDropTable     => "#{game_balance}ItemDropTable.gam",
    D3MPQ::CoreData::GameBalance::ItemEnhancements  => "#{game_balance}ItemEnhancements.gam",
    D3MPQ::CoreData::GameBalance::Items             => items,
    D3MPQ::CoreData::GameBalance::LabelsGlobal      => "#{game_balance}LabelsGlobal.gam",
    D3MPQ::CoreData::GameBalance::MonsterAffixes    => "#{game_balance}MonsterAffixes.gam",
    D3MPQ::CoreData::GameBalance::MonsterNames      => "#{game_balance}MonsterNames.gam",
    D3MPQ::CoreData::GameBalance::PowerFormulaTables  => "#{game_balance}PowerFormulaTables.gam",
    D3MPQ::CoreData::GameBalance::SocketedEffects   => "#{game_balance}SocketedEffects.gam"
  }.each do |parser, file|
    describe "Analyzer for #{parser.to_s}##{file}" do
      subject { D3MPQ::Analyzer.new(parser, file) }
      specify { expect { subject.write }.to_not raise_error }
    end
  end

  # Parse all fields
  {
    D3MPQ::CoreData::GameBalance::SetItemBonuses    => "#{game_balance}SetItemBonuses.gam"
  }.each do |parser, file|
    describe "Analyzer for #{parser.to_s}##{file}" do
      subject { D3MPQ::Analyzer.new(parser, file, nil) }
      specify { expect { subject.write }.to_not raise_error }
    end
  end
end

