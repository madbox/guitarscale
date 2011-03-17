require 'spec_helper'

describe "intervals/show.html.erb" do
  before(:each) do
    @interval = assign(:interval, stub_model(Interval,
      :number => 1,
      :length => 1,
      :scale_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
