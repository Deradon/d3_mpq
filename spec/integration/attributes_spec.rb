require 'spec_helper'

describe D3MPQ::Attributes, :integration => true do
  parser = D3MPQ::Attributes

  let(:path) { "spec/fixtures/attributes.xml" }
  subject { D3MPQ::Attributes.new(path) }

  specify { subject.content.count == 823 }

  describe "Analyzer for #{parser.to_s}" do
    subject { D3MPQ::Analyzer.new(parser, path) }
    specify { subject.write }
  end
end

