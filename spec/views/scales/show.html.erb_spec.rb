require 'spec_helper'

describe "scales/show.html.erb" do
  before(:each) do
    @scale = assign(:scale, stub_model(Scale,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
