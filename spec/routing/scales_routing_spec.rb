require "spec_helper"

describe ScalesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/scales" }.should route_to(:controller => "scales", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/scales/new" }.should route_to(:controller => "scales", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/scales/1" }.should route_to(:controller => "scales", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/scales/1/edit" }.should route_to(:controller => "scales", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/scales" }.should route_to(:controller => "scales", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/scales/1" }.should route_to(:controller => "scales", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/scales/1" }.should route_to(:controller => "scales", :action => "destroy", :id => "1")
    end

  end
end
