require 'spec_helper'

describe D3MPQ::CSVGenerator::Items do
  describe "#write" do
    [
      "Items_Armor.gam",
      "Items_Weapons.gam",
      "Items_Other.gam",
      "Items_Quests_Beta.gam"
    ].each do |file_name|
      context "when called with: Items_Armor.gam" do
        let(:input) { "spec/fixtures/CoreData/GameBalance/#{file_name}" }
        specify { subject.files = input; subject.write }
      end
    end
  end
end

