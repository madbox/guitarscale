require 'spec_helper'

describe "intervals/index.html.erb" do
  before(:each) do
    assign(:intervals, [
      stub_model(Interval,
        :number => 1,
        :length => 1,
        :scale_id => 1
      ),
      stub_model(Interval,
        :number => 1,
        :length => 1,
        :scale_id => 1
      )
    ])
  end

  it "renders a list of intervals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
