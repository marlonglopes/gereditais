# encoding: utf-8

class DownloadsController < ApplicationController

	before_filter :login_required
	before_filter :check_admin_for_download

	def index
		@title="Downloads"
	end

	def new
	
		@title="Novo Download"

		if params[:edital_id] 
			@edital=Edital.find_by_id(params[:edital_id])
			@download=@edital.download.new

			respond_to do |format|
				format.html
				format.js
			end
			
		else
			redirect_to root_path
		end

	end

#	def create

#		@edital=Edital.find(params[:edital_id])

#		respond_to do |format|
#			format.html 
#			format.js
#		end

#	end

	def create

		session[:save]=false
		if params[:edital_id] 

			@edital=Edital.find(params[:edital_id])

			agora = Time.now 
			abertura = @edital.abertura 
			
			if agora < abertura

				@download=@edital.download.new(:user_id=>current_user.id)
				
				if @download.save
					session[:save]=true
					respond_to do |format|
						format.html 
						format.js
					end
				else
					flash[:error] = "Download não efetuado."
#					redirect_to @edital
				end
			else
			  flash[:error] = "Após data da abertura não é possivel efetuar download"
#			  redirect_to @edital
			end

		else
#			redirect_to root_path
		end

	end

	def show

		 respond_to do |format|
		   format.html
		   format.js
		 end

	end


end
