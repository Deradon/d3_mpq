require 'spec_helper'

describe D3MPQ::CSVGenerator::PowerFormulaTables do
  let(:dir) { "spec/fixtures/CoreData/GameBalance/PowerFormulaTables.gam" }

  specify "#write" do
    subject.files = dir
    subject.write
  end
end

