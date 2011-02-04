# encoding: utf-8

class ImpugnationsController < ApplicationController

	before_filter :login_required
	before_filter :check_admin, :only => [:index, :show]


	def impugnation
		begin
			edital = Edital.find(params[:edital_id])
			impugnation  = edital.impugnation.find(params[:id])
			send_file impugnation.arquivo.path, :type => impugnation.arquivo_content_type
		rescue
		end		
	end

  def index
	 @edital=Edital.find_by_id(params[:edital_id])
    @impugnations = @edital.impugnation.scoped

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @impugnations }
    end
  end

  def show

	begin

	 @edital=Edital.find_by_id(params[:edital_id])
    @impugnation = @edital.impugnation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end

	rescue
	end

  end

  def new
	 @edital=Edital.find_by_id(params[:edital_id])
    @impugnation = @edital.impugnation.new

    respond_to do |format|
      format.html
      format.js
    end
  end


  def edit
    @edital = Edital.find(params[:edital_id])
    @impugnation = @edital.impugnation.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end

  end

  def create
	
    @edital=Edital.find_by_id(params[:impugnation][:edital_id])
    @impugnation = @edital.impugnation.new(params[:impugnation])

    respond_to do |format|
      if @impugnation.save
#        ImpugnationMailer.impugnation_create(@edital , current_user, @impugnation).deliver  
        ImpugnationMailer.delay.impugnation_create(@edital , current_user, @impugnation)
		  flash[:notice] = "Impugnação enviada com sucesso."
        format.html { redirect_to(@impugnation.edital) }
      else
  		  flash[:error] = "Impugnação no formáto inválido."
  		  flash[:impugnation_error] = "Impugnação no formáto inválido."
        format.html { redirect_to(@impugnation.edital) }
      end
    end
  end

  def update
    @edital = Edital.find(params[:edital_id])
    @impugnation = @edital.impugnation.find(params[:id])

    respond_to do |format|
      if @impugnation.update_attributes(params[:impugnation])
#       ImpugnationMailer.impugnation_update(@edital , current_user,@impugnation).deliver  
        ImpugnationMailer.delay.impugnation_update(@edital , current_user,@impugnation)
		  flash[:notice] = "Impugnação atualizada com sucesso."
        format.html { redirect_to(@impugnation.edital) }
      else
		  flash[:error] = "Impugnação no formáto inválido."
		  flash[:impugnation_error] = "Impugnação no formáto inválido."
        format.html { redirect_to(@impugnation.edital) }
      end
    end
  end

  def destroy

    @edital = Edital.find(params[:edital_id])
    @impugnation = @edital.impugnation.find(params[:id])
    @impugnation.destroy

    respond_to do |format|
      format.html { redirect_to(edital_impugnations_url) }
    end
  end
end
