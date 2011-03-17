require 'spec_helper'

describe "intervals/new.html.erb" do
  before(:each) do
    assign(:interval, stub_model(Interval,
      :number => 1,
      :length => 1,
      :scale_id => 1
    ).as_new_record)
  end

  it "renders new interval form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => intervals_path, :method => "post" do
      assert_select "input#interval_number", :name => "interval[number]"
      assert_select "input#interval_length", :name => "interval[length]"
      assert_select "input#interval_scale_id", :name => "interval[scale_id]"
    end
  end
end
