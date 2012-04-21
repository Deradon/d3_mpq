require 'spec_helper'

describe D3MPQ::Analyzer do
  let(:parser) { D3MPQ::CoreData::GameBalance::ItemTypes }
  let(:file) { "spec/fixtures/CoreData/GameBalance/ItemTypes.gam" }

  subject { D3MPQ::Analyzer.new(parser, file, :content) }

  its(:attributes) { should be_kind_of(Hash) }
  specify { expect { subject.write }.to_not raise_error }
end

