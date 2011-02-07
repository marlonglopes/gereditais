# encoding: utf-8

class UserMailer < ActionMailer::Base

	default :from => "marlonglopes@gmail.com"  

	def user_create(user)  
	 @user=user
	 mail(:to => user.email, :subject => "Novo Cadastro")  
	end  


	def user_update(user)  
	 @user=user
	 mail(:to => user.email, :subject => "Alteração de Cadastro") 
	end  

end
