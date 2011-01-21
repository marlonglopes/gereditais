# encoding: utf-8

class UserMailer < ActionMailer::Base

	default :from => "ghc@ghc.com.br"  

	def user_create(user)  
	 @user=user
	 mail(:to => user.email, :subject => "Novo Cadastro")  do |format|
		format.text
		format.html
	 end
	end  


	def user_update(user)  
	 @user=user
	 mail(:to => user.email, :subject => "Alteração de Cadastro") do |format|
		format.text
		format.html
	 end
	end  

end
