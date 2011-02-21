# encoding: utf-8

class UsersController < ApplicationController

  	before_filter :login_required, :except => [:new, :create]

	def index

		if logged_in? and current_user.admin?
			@users=User.scoped.paginate(:page => params[:page], :per_page=>10)
		else

		end
	
	end

  def show
    @user = User.find(params[:id])
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.accessible = :all if logged_in? and current_user.admin?    
    @user.attributes=params[:user]
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Perfil criado com sucesso, Voce está logado."
#		UserMailer.user_create(@user).deliver
		UserMailer.delay.user_create(@user)
      redirect_to root_path
    else
      render :action => 'new'
    end
  end

  def edit
#    @user = current_user
	
    @user = User.find(params[:id])
	 redirect_to root_path if current_user!=@user && current_user.admin==false

  end

  def update
#    @user = current_user
    @user = User.find(params[:id])
    @user.accessible = :all if logged_in? and current_user.admin?
   	
    if @user.update_attributes(params[:user])
      flash[:success] = "Perfil do usuário atualizado."
#  		UserMailer.user_update(@user).deliver
  		UserMailer.delay.user_update(@user) 
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end
end
