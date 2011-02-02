# encoding: utf-8

class EditalsController < ApplicationController

	# filter at the top always
	before_filter :login_required, :except => [:index, :show]
	before_filter :check_admin, :except => [:index, :show, :edital]

	caches_page :index, :show
	cache_sweeper :edital_sweeper, :only=>[:create, :update, :destroy]

	def edital

		begin
			if session[:save]
				edital = Edital.find(params[:id])
				send_file edital.edital.path, :type => edital.edital_content_type
				session[:save]=false
			else
				flash[:error] = "Não foi possível fazer download do Edital"
		  		redirect_to root_path
#		  		redirect_to new_edital_download_path(@edital)
#				render :action=>"create", :controller=>"downloads"
			end
		rescue
			flash[:error] = "Não foi possível fazer download do Edital"
	  		redirect_to root_path
#	  		redirect_to root_path
#			render :action=>"create", :controller=>"downloads"
		end

	end

#	def edital

#		begin

#			@edital=Edital.find(params[:id])
#			@download=@edital.download.new(:user=>current_user)

#			if @download.save!
#				send_file @edital.edital.path, :type => @edital.edital_content_type
#			else
#				flash[:error] = "Não foi possível fazer download do Edital"
#	  			redirect_to new_edital_download_path(@edital)
#			end
#		rescue
#			flash[:error] = "Não foi possível fazer download do Edital"
#	  		redirect_to root_path
#		end

#	end


  def index

	@modalidades ||= Modalidade.scoped(:order => "descricao")

 	begin
		params[:search][:data_abertura_gte]=get_data(params[:search][:data_abertura_gte],0)
		params[:search][:data_abertura_lte]=get_data(params[:search][:data_abertura_lte],1)

		params[:search][:data_publicacao_gte]=get_data(params[:search][:data_publicacao_gte],0)
		params[:search][:data_publicacao_lte]=get_data(params[:search][:data_publicacao_lte],1)
	rescue
	end

	if logged_in? and current_user.admin?
		@search = Edital.includes(:modalidade).search(params[:search])
		@editals = @search.order("updated_at DESC").paginate(:page => params[:page], :per_page=>10)
	else
		@search = Edital.publicados.includes(:modalidade).search(params[:search])
		@editals = @search.order("updated_at DESC").paginate(:page => params[:page], :per_page=>10)
	end

    respond_to do |format|
      format.html
      format.js
    end

  end
  
  def show

	 @modalidades ||= Modalidade.scoped(:order => "descricao")

    @edital = Edital.find(params[:id])
    @upload = @edital.upload.new
  	 @impugnation = @edital.impugnation.new

	 @microposts=@edital.micropost.scoped.paginate(:page => params[:page], :per_page=>5)
	 @micropost=@edital.micropost.new

    respond_to do |format|
      format.html
      format.js
    end

  end
  
  def new

	@modalidades ||= Modalidade.scoped(:order => "descricao")
	@edital = Edital.new

  end
  
  def create

	 @modalidades ||= Modalidade.scoped(:order => "descricao")
    @edital = Edital.new(params[:edital])

	if logged_in? 
		@user_downloads= current_user.group_by_editals
	end

    if @edital.save
      flash[:notice] = "Edital criado com sucesso."
      redirect_to @edital
    else
      render :action => 'new'
    end
  end
  
  def edit

	 @modalidades ||= Modalidade.scoped(:order => "descricao")
    @edital = Edital.find(params[:id])

  end
  
  def update

	 @modalidades ||= Modalidade.scoped(:order => "descricao")
    @edital = Edital.find(params[:id])

    if @edital.update_attributes(params[:edital])
      flash[:notice] = "Edital atualizado com sucesso."
      redirect_to @edital
    else
      render :action => 'edit'
    end
  end
  
  def destroy

	 @modalidades ||= Modalidade.scoped(:order => "descricao")
    @edital = Edital.find(params[:id])

    @edital.destroy
    flash[:notice] = "Edital apagado."
    redirect_to editals_url
  end

private

	def get_data(data,tr)

		return if data.empty?

		date=data.split("/")

		hora="23:59"
		data="#{date[2].to_i}/#{date[1].to_i}/#{date[0].to_i}"

		if tr==1
			Time.parse("#{data} #{hora}")
		else
			Date.parse("#{data}")
		end

	end

end
