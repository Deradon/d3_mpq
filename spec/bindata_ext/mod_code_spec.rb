require 'spec_helper'

describe D3MPQ::ModCode do
  subject { D3MPQ::ModCode.new }

  specify { subject.respond_to?(:mod_code).should be_true }
  specify { subject.respond_to?(:mod_param1).should be_true }
  specify { subject.respond_to?(:mod_param2).should be_true }
  specify { subject.respond_to?(:mod_param3).should be_true }
  specify { subject.respond_to?(:data).should be_true }

  describe "#id" do
    context "when mod_code is 0xFFFFFFFF" do
      before(:all) { subject.mod_code = 0xFFFFFFFF }
      its(:id) { should be_nil }
    end
    context "when mod_code is not 0xFFFFFFFF" do
      before(:all) { subject.mod_code = 0x42 }
      specify { subject.id.should == subject.mod_code }
      specify { subject.id.should be_kind_of(Integer) }
    end
  end
end

