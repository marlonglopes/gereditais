# encoding: utf-8

class UsersController < ApplicationController

  	before_filter :login_required, :except => [:new, :create]
	before_filter :check_admin, :only => [:index]

	def index

		if logged_in? and current_user.admin?
			@users=User.scoped.paginate(:page => params[:page], :per_page=>10)
		else

		end
	
	end

  def show
    @user = User.find_by_id(params[:id])
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Voce está logado."
#		UserMailer.user_create(@user).deliver
		UserMailer.delay.user_create(@user)
      redirect_to root_path
    else
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Seu perfil foi atualizado."
#  		UserMailer.user_update(@user).deliver
  		UserMailer.delay.user_update(@user) 
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end
end
