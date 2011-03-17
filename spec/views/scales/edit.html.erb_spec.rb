require 'spec_helper'

describe "scales/edit.html.erb" do
  before(:each) do
    @scale = assign(:scale, stub_model(Scale,
      :name => "MyString"
    ))
  end

  it "renders the edit scale form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => scales_path(@scale), :method => "post" do
      assert_select "input#scale_name", :name => "scale[name]"
    end
  end
end
