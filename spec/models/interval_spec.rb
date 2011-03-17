require 'spec_helper'

describe Interval do
  # Testing factories and predefined parametrs
  subject { Factory.build :interval }
  it { should be_valid }
end
