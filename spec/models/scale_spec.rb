require 'spec_helper'

describe Scale do
  describe "factory should build chromatic scale" do 
    subject { Factory.build :scale }
    it { should be_valid }
    it { ( subject.name == "chromatic" ).should be_true }
    it { should have(11).intervals }
    it { (subject.notes_pattern == [0,1,2,3,4,5,6,7,8,9,10,11])}
  end

  describe "pentatonic minor creation" do
    it "should contain 0,3,5,7,9" do
      scale = Scale.create("pentatonic")
      scale.set_intervals [3,2,2,2]
      ( scale.notes_pattern == [0,3,5,7,9] ).should be_true
    end
  end
  
end
