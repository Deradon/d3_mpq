require 'spec_helper'

describe D3MPQ::CSVGenerator::RecipeDetails do
  let(:dir) { "spec/fixtures/Recipe" }
  let(:entries) { Dir.open(dir).entries[0,10].map { |e| "spec/fixtures/Recipe/#{e}" } }

  specify "#write" do
    subject.files = entries
    subject.write
  end
end

