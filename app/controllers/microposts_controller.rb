# encoding: utf-8

class MicropostsController < ApplicationController

	before_filter :login_required

  # GET /microposts
  # GET /microposts.xml
  def index
	 @user=current_user
	 @edital=Edital.find_by_id(params[:edital_id])
	 @microposts=@edital.micropost.scoped.paginate(:page => params[:page], :per_page=>5)

    respond_to do |format|
      format.html # index.html.erb
 		format.js
    end
  end

  # GET /microposts/1
  # GET /microposts/1.xml
  def show

	 @user=current_user
	 @edital=Edital.find_by_id(params[:edital_id])
    @micropost = @edital.micropost.find(params[:id])

#    @micropost = Micropost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /microposts/new
  # GET /microposts/new.xml
  def new

	 @user=current_user
	 @edital=Edital.find_by_id(params[:edital_id])
    @micropost = @edital.micropost.new

#    @micropost = Micropost.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @micropost }
    end
  end

  # GET /microposts/1/edit
  def edit
	 @user=current_user
	 @edital=Edital.find_by_id(params[:edital_id])
    @micropost = @edital.micropost.find_by_id(params[:id])

#    @micropost = Micropost.find(params[:id])
  end

  # POST /microposts
  # POST /microposts.xml
  def create

	 @user=current_user
	 @edital=Edital.find_by_id(params[:micropost][:edital_id])
    @micropost = @edital.micropost.new(params[:micropost])

#    @micropost = Micropost.new(params[:micropost])

    respond_to do |format|
      if @micropost.save
	 		@microposts=@edital.micropost.scoped.paginate(:page => params[:page], :per_page=>5)
			
        format.html { redirect_to(@edital, :notice => 'Micropost was successfully created.') }
        format.xml  { render :xml => @edital, :status => :created, :location => @edital }
		  format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @micropost.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /microposts/1
  # PUT /microposts/1.xml
  def update
	 @user=current_user
	 @edital=Edital.find_by_id(params[:edital_id])
    @micropost = @edital.micropost.find_by_id(params[:id])

#    @micropost = Micropost.find(params[:id])

    respond_to do |format|
      if @micropost.update_attributes(params[:micropost])
        format.html { redirect_to([@edital,@micropost], :notice => 'Micropost was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @micropost.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /microposts/1
  # DELETE /microposts/1.xml
  def destroy

	 @user=current_user
	 @edital=Edital.find_by_id(params[:edital_id])
    @micropost = @edital.micropost.find(params[:id])

#    @micropost = Micropost.find(params[:id])
    @micropost.destroy

    respond_to do |format|
      format.html { redirect_to(edital_microposts_url) }
      format.xml  { head :ok }
    end
  end
end
