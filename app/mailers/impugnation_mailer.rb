# encoding: utf-8

class ImpugnationMailer < ActionMailer::Base

	default :from => "ghc@ghc.com.br"  

	def impugnation_create(edital,user,impugnation)  
	 @user=user
	 @edital=edital
    attachments[impugnation.arquivo_file_name] = File.read(impugnation.arquivo.path)  
	 mail(:to =>["marlonglopes@gmail.com","lmarlon@ghc.com.br"], :subject => "Nova Impugnação")  do |format|
		format.text
		format.html
	 end

#	 mail(:to =>["marlonglopes@gmail.com",
#	 				"cacm@ghc.com.br",
#	 				"lmarlon@ghc.com.br",
#	 				"beverton@ghc.com.br"], :subject => "Nova Impugnação")  

	end  

	def impugnation_update(edital,user,impugnation)  
	 @user=user
	 @edital=edital
    attachments[impugnation.arquivo_file_name] = File.read(impugnation.arquivo.path) 
	 mail(:to =>["marlonglopes@gmail.com",
	 				"lmarlon@ghc.com.br"], :subject => "Alteração Impugnação")  do |format|
		format.text
		format.html
	 end

#	 mail(:to =>["marlonglopes@gmail.com",
#	 				"cacm@ghc.com.br",
#	 				"lmarlon@ghc.com.br",
#	 				"beverton@ghc.com.br"], :subject => "Alteração Impugnação")  


	end  

end
