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

	def create

		if params[:edital_id] 

			@edital=Edital.find_by_id(params[:edital_id])
			@download=@edital.download.new(:user=>current_user)

			if @download.save!
				respond_to do |format|
					format.html {redirect_to new_edital_download_path(@edital),:success=> "Download efetuado com sucesso."}
					format.js
				end
			else
				  flash[:error] = "Download não efetuado."
				  redirect_to @edital			
			end
		else
			redirect_to root_path
		end

	end

	def show

		 respond_to do |format|
		   format.html
		   format.js
		 end

	end


end
