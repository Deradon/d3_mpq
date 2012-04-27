require 'spec_helper'

describe D3MPQ::Attributes do
  let(:path) { "spec/fixtures/attributes.xml" }
  let(:attributes) { D3MPQ::Attributes.new(path) }
  subject { attributes }

  its(:content) { should be_a_kind_of(Array) }

  describe "first children" do
    subject { attributes.content.first }

    its(:id) { should_not be_nil }
    its(:u2) { should_not be_nil }
    its(:u3) { should_not be_nil }
    its(:u4) { should_not be_nil }
    its(:u5) { should_not be_nil }
    its(:script_a) { should_not be_nil }
    its(:script_b) { should_not be_nil }
    its(:name) { should_not be_nil }
    its(:encoding_type) { should_not be_nil }
    its(:u10) { should_not be_nil }
    its(:min) { should_not be_nil }
    its(:max) { should_not be_nil }
    its(:bit_count) { should_not be_nil }
  end
end

describe D3MPQ::Attributes::Attribute do
  specify { subject.respond_to?(:id).should be_true }
  specify { subject.respond_to?(:u2).should be_true }
  specify { subject.respond_to?(:u3).should be_true }
  specify { subject.respond_to?(:u4).should be_true }
  specify { subject.respond_to?(:u5).should be_true }
  specify { subject.respond_to?(:script_a).should be_true }
  specify { subject.respond_to?(:script_b).should be_true }
  specify { subject.respond_to?(:name).should be_true }
  specify { subject.respond_to?(:encoding_type).should be_true }
  specify { subject.respond_to?(:u10).should be_true }
  specify { subject.respond_to?(:min).should be_true }
  specify { subject.respond_to?(:max).should be_true }
  specify { subject.respond_to?(:bit_count).should be_true }
end

