require 'spec_helper'

describe MinMax do
  describe ".new" do
    context "when called w/o params" do
      subject { MinMax.new }
      its(:min) { should == 0 }
      its(:max) { should == 0 }
    end

    context "when called with min" do
      subject { MinMax.new(1.0) }
      its(:min) { should == 1.0 }
      its(:max) { should == 1.0 }
    end

    context "when called with min and max" do
      context "and min > max" do
        subject { MinMax.new(2.0, 1.0) }
        its(:min) { should == 1.0 }
        its(:max) { should == 2.0 }
      end
      context "and min <= max" do
        subject { MinMax.new(1.0, 2.0) }
        its(:min) { should == 1.0 }
        its(:max) { should == 2.0 }
      end
    end
  end

  let(:a) { MinMax.new(1.0, 2.0) }
  let(:b) { MinMax.new(3.0, 4.0) }

  describe "#+" do
    specify { (a + b).min.should == 4.0 }
    specify { (a + b).max.should == 6.0 }
  end

  describe "#-" do
    specify { (a - b).min.should == -3.0 }
    specify { (a - b).max.should == -1.0 }
  end

  describe "#*" do
    specify { (a * b).min.should == 3 }
    specify { (a * b).max.should == 8 }

    context "when min is < 0" do
      let(:a) { MinMax.new(-3.0, 2.0) }
      let(:b) { MinMax.new(-4.0, 3.0) }

      specify { (a * b).min.should == -9 }
      specify { (a * b).max.should == 12 }
    end
  end

  describe "#/" do
    specify { (a / b).min.should == 1.to_f/4 }
    specify { (a / b).max.should == 2.to_f/3 }
    pending "Add TestCases for edges"
  end
end

