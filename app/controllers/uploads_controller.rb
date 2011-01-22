# encoding: utf-8

class UploadsController < ApplicationController

  before_filter :login_required

  def upload

		begin
		edital = Edital.find(params[:edital_id])
		upload  = edital.upload.find(params[:id])

		if current_user.admin?
				agora = Time.now 
				abertura = edital.abertura 
				if agora < abertura
					flash[:error] = "Não é possível ver propostas antes da data de abertura"
			  		redirect_to edital_path(edital)
				else 
		  			send_file upload.arquivo.path, :type => upload.arquivo_content_type
				end
		else if upload.user==current_user
	  				send_file upload.arquivo.path, :type => upload.arquivo_content_type
	  			else
					flash[:error] = "Usuário sem permissão para download dessa proposta"
			  		redirect_to edital_path(edital)
	  			end
	  	end
		rescue
			flash[:error] = "Não foi possível fazer download da proposta"
	  		redirect_to root_path
		end
  end

  def index
	 @edital=Edital.find_by_id(params[:edital_id])
	 @uploads = @edital.upload.scoped
  end
  
  def show
	 @edital=Edital.find_by_id(params[:edital_id])
    @upload = @edital.upload.find(params[:id])
  end
  
  def new
	 @edital=Edital.find_by_id(params[:edital_id])
    @upload = @edital.upload.new

 	respond_to do |format|
      format.html # new.html.erb
      format.js
    end

  end
  
  def create

	@edital=Edital.find_by_id(params[:upload][:edital_id])
	@upload = @edital.upload.new(params[:upload])

    if @upload.save
      flash[:notice] = "Upload efetuado com sucesso."
      respond_to do |format|
        format.html { redirect_to @upload.edital }
      end
    else
      flash[:error] = "Problemas no envio do arquivo. Enviar apenas arquivos .pdf"
      flash[:upload_error] = "Problemas no envio do arquivo. Enviar apenas arquivos .pdf"
      redirect_to @upload.edital
    end

  end
  
  def edit
    @edital = Edital.find(params[:edital_id])
    @upload = @edital.upload.find(params[:id])

   respond_to do |format|
      format.html
      format.js
    end

  end
  
  def update
    @edital = Edital.find(params[:edital_id])
    @upload = @edital.upload.find(params[:id])
    if @upload.update_attributes(params[:upload])
      flash[:notice] = "Atualização de upload com sucesso."
      redirect_to @upload.edital
    else
      flash[:error] = "Problemas no envio do arquivo. Enviar apenas arquivos .pdf"
      flash[:upload_error] = "Problemas no envio do arquivo. Enviar apenas arquivos .pdf"
      redirect_to @upload.edital
    end
  end
  
  def destroy
 	 @edital = Edital.find(params[:edital_id])
    @upload = @edital.upload.find(params[:id])
    @upload.destroy
    flash[:notice] = "Upload apagado com sucesso."
    redirect_to uploads_url
  end
  
end
