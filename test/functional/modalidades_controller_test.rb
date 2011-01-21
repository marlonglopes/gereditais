require 'test_helper'

class ModalidadesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Modalidade.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Modalidade.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Modalidade.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to modalidade_url(assigns(:modalidade))
  end
  
  def test_edit
    get :edit, :id => Modalidade.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Modalidade.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Modalidade.first
    assert_template 'edit'
  end

  def test_update_valid
    Modalidade.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Modalidade.first
    assert_redirected_to modalidade_url(assigns(:modalidade))
  end
  
  def test_destroy
    modalidade = Modalidade.first
    delete :destroy, :id => modalidade
    assert_redirected_to modalidades_url
    assert !Modalidade.exists?(modalidade.id)
  end
end
