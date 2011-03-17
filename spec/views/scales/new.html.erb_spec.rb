require 'spec_helper'

describe "scales/new.html.erb" do
  before(:each) do
    assign(:scale, stub_model(Scale,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new scale form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => scales_path, :method => "post" do
      assert_select "input#scale_name", :name => "scale[name]"
    end
  end
end
