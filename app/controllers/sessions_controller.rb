# encoding: utf-8

class SessionsController < ApplicationController
 
 def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      flash[:notice] = "Voce está logado."
      redirect_to_target_or_default(root_path)
    else
      flash.now[:error] = "Usuario ou Senha errado."
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Voce não esta mais logado"
    redirect_to root_path
  end
end
