require 'spec_helper'

describe D3MPQ::Analyzer, :integration => true do
  game_balance = "spec/fixtures/CoreData/GameBalance/"

  {
    D3MPQ::CoreData::GameBalance::ItemTypes => "#{game_balance}ItemTypes.gam"
  }.each do |parser, file|
    describe "Analyzer for '#{parser.to_s}'#{file}" do
      subject { D3MPQ::Analyzer.new(parser, file) }
      its(:attributes) { should be_kind_of(Hash) }
      specify { expect { subject.write }.to_not raise_error }
    end
  end
end

