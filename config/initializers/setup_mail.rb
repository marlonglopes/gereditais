
ActionMailer::Base.raise_delivery_errors = true
#ActionMailer::Base.perform_deliveries = true
#ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {  
<<<<<<< HEAD
  :address              => "smtp.gmail.com",  
  :port                 => 587,  
  :domain               => "gmail.com",  
  :user_name            => "ginfghc",  
  :password             => "fricazoid6280",  
  :authentication       => "plain",  
  :enable_starttls_auto => true  
}  
=======
	:address              => "smtp.gmail.com",
	:port                 => 587,
   :domain               => "gmail.com",  	
	:user_name            => "ginfghc@gmail.com",  
	:password             => "fricazoid6280",  
	:authentication       => 'plain',
	:enable_starttls_auto => true  
}

#ActionMailer::Base.smtp_settings = {  
#	:address              => "smtp.gmail.com",  
#	:port                 => 587,  
#	:user_name            => "ginfghc@gmail.com",  
#	:password             => "fricazoid6280",  
#	:authentication       => "plain",
#	:enable_starttls_auto => true
#}  



#ActionMailer::Base.smtp_settings = {  
#  :address              => "smtp.gmail.com",  
#  :port                 => 587,  
#  :domain               => "asciicasts.com",  
#  :user_name            => "asciicasts",  
#  :password             => "secret",  
#  :authentication       => "plain",  
#  :enable_starttls_auto => true  
#}  
>>>>>>> 73f4dda4346d72b4e6cfc6a32e41b1cb35dfd9b4
