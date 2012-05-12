require 'spec_helper'

describe D3MPQ::CSVGenerator::Recipes do
  describe "#write" do
    [
      "RecipesBlacksmith.gam",
      "RecipesJeweler.gam",
      "RecipesMystic.gam"
    ].each do |file_name|
      context "when called with: #{file_name}" do
        let(:input) { "spec/fixtures/CoreData/GameBalance/#{file_name}" }
        specify { subject.files = input; subject.write }
      end
    end
  end
end

