require 'spec_helper'

describe "scales/index.html.erb" do
  before(:each) do
    assign(:scales, [
      stub_model(Scale,
        :name => "Name"
      ),
      stub_model(Scale,
        :name => "Name"
      )
    ])
  end

  it "renders a list of scales" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
