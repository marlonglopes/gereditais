require "spec_helper"

describe ImpugnacaosController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/impugnacaos" }.should route_to(:controller => "impugnacaos", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/impugnacaos/new" }.should route_to(:controller => "impugnacaos", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/impugnacaos/1" }.should route_to(:controller => "impugnacaos", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/impugnacaos/1/edit" }.should route_to(:controller => "impugnacaos", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/impugnacaos" }.should route_to(:controller => "impugnacaos", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/impugnacaos/1" }.should route_to(:controller => "impugnacaos", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/impugnacaos/1" }.should route_to(:controller => "impugnacaos", :action => "destroy", :id => "1")
    end

  end
end
