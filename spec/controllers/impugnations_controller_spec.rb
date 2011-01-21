require 'spec_helper'

describe ImpugnationsController do

  def mock_impugnation(stubs={})
    (@mock_impugnation ||= mock_model(Impugnation).as_null_object).tap do |impugnation|
      impugnation.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all impugnations as @impugnations" do
      Impugnation.stub(:all) { [mock_impugnation] }
      get :index
      assigns(:impugnations).should eq([mock_impugnation])
    end
  end

  describe "GET show" do
    it "assigns the requested impugnation as @impugnation" do
      Impugnation.stub(:find).with("37") { mock_impugnation }
      get :show, :id => "37"
      assigns(:impugnation).should be(mock_impugnation)
    end
  end

  describe "GET new" do
    it "assigns a new impugnation as @impugnation" do
      Impugnation.stub(:new) { mock_impugnation }
      get :new
      assigns(:impugnation).should be(mock_impugnation)
    end
  end

  describe "GET edit" do
    it "assigns the requested impugnation as @impugnation" do
      Impugnation.stub(:find).with("37") { mock_impugnation }
      get :edit, :id => "37"
      assigns(:impugnation).should be(mock_impugnation)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created impugnation as @impugnation" do
        Impugnation.stub(:new).with({'these' => 'params'}) { mock_impugnation(:save => true) }
        post :create, :impugnation => {'these' => 'params'}
        assigns(:impugnation).should be(mock_impugnation)
      end

      it "redirects to the created impugnation" do
        Impugnation.stub(:new) { mock_impugnation(:save => true) }
        post :create, :impugnation => {}
        response.should redirect_to(impugnation_url(mock_impugnation))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved impugnation as @impugnation" do
        Impugnation.stub(:new).with({'these' => 'params'}) { mock_impugnation(:save => false) }
        post :create, :impugnation => {'these' => 'params'}
        assigns(:impugnation).should be(mock_impugnation)
      end

      it "re-renders the 'new' template" do
        Impugnation.stub(:new) { mock_impugnation(:save => false) }
        post :create, :impugnation => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested impugnation" do
        Impugnation.should_receive(:find).with("37") { mock_impugnation }
        mock_impugnation.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :impugnation => {'these' => 'params'}
      end

      it "assigns the requested impugnation as @impugnation" do
        Impugnation.stub(:find) { mock_impugnation(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:impugnation).should be(mock_impugnation)
      end

      it "redirects to the impugnation" do
        Impugnation.stub(:find) { mock_impugnation(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(impugnation_url(mock_impugnation))
      end
    end

    describe "with invalid params" do
      it "assigns the impugnation as @impugnation" do
        Impugnation.stub(:find) { mock_impugnation(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:impugnation).should be(mock_impugnation)
      end

      it "re-renders the 'edit' template" do
        Impugnation.stub(:find) { mock_impugnation(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested impugnation" do
      Impugnation.should_receive(:find).with("37") { mock_impugnation }
      mock_impugnation.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the impugnations list" do
      Impugnation.stub(:find) { mock_impugnation }
      delete :destroy, :id => "1"
      response.should redirect_to(impugnations_url)
    end
  end

end
