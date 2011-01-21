require "spec_helper"

describe ImpugnationsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/impugnations" }.should route_to(:controller => "impugnations", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/impugnations/new" }.should route_to(:controller => "impugnations", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/impugnations/1" }.should route_to(:controller => "impugnations", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/impugnations/1/edit" }.should route_to(:controller => "impugnations", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/impugnations" }.should route_to(:controller => "impugnations", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/impugnations/1" }.should route_to(:controller => "impugnations", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/impugnations/1" }.should route_to(:controller => "impugnations", :action => "destroy", :id => "1")
    end

  end
end
