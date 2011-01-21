require 'test_helper'

class EditalsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Edital.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Edital.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Edital.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to edital_url(assigns(:edital))
  end
  
  def test_edit
    get :edit, :id => Edital.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Edital.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Edital.first
    assert_template 'edit'
  end

  def test_update_valid
    Edital.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Edital.first
    assert_redirected_to edital_url(assigns(:edital))
  end
  
  def test_destroy
    edital = Edital.first
    delete :destroy, :id => edital
    assert_redirected_to editals_url
    assert !Edital.exists?(edital.id)
  end
end
