require 'spec_helper'

describe Scale do
  describe "factory should build chromatic scale" do 
    subject { Factory.build :scale }
    it { should be_valid }
    it { ( subject.name == "chromatic" ).should be_true }
    it { should have(12).intervals }
  end
end
