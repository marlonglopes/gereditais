# encoding: utf-8

class ModalidadesController < ApplicationController

	before_filter :login_required, :except => [:index, :show]
	before_filter :check_admin, :except => [:index, :show]
	
  def index
    @modalidades = Modalidade.scoped
  end
  
  def show
    @modalidade = Modalidade.find(params[:id])
  end
  
  def new
    @modalidade = Modalidade.new
  end
  
  def create
    @modalidade = Modalidade.new(params[:modalidade])
    if @modalidade.save
      flash[:notice] = "Modalidade criada com sucesso."
      redirect_to @modalidade
    else
      render :action => 'new'
    end
  end
  
  def edit
    @modalidade = Modalidade.find(params[:id])
  end
  
  def update
    @modalidade = Modalidade.find(params[:id])
    if @modalidade.update_attributes(params[:modalidade])
      flash[:notice] = "Modalidade atualizada com sucesso."
      redirect_to @modalidade
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @modalidade = Modalidade.find(params[:id])
    @modalidade.destroy
    flash[:notice] = "Modalidade apagada com sucesso."
    redirect_to modalidades_url
  end
end
