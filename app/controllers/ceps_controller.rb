# encoding: utf-8

class CepsController < ApplicationController

	respond_to :html, :js , :xml

	def index
		begin
			@ceps=Cep.scoped.paginate(:page => params[:page], :per_page=>10)
			respond_with(@ceps)
		rescue
			
		end
	end


	def show
		
		begin
			@cep=Cep.find_by_cep(params[:id])
			respond_with(@cep)
		rescue
			
		end
	end


end
