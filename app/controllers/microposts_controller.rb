# encoding: utf-8

class MicropostsController < ApplicationController

	before_filter :login_required

  def index
	 @user=current_user
	 @edital=Edital.find(params[:edital_id])
	 @microposts=@edital.micropost.scoped.paginate(:page => params[:page], :per_page=>5)

    respond_to do |format|
      format.html
 		format.js
    end
  end

  def show

	 @user=current_user
	 @edital=Edital.find(params[:edital_id])
    @micropost = @edital.micropost.find(params[:id])

	respond_to do |format|
		format.html
	end
  end

  def new

	 @user=current_user
	 @edital=Edital.find(params[:edital_id])
    @micropost = @edital.micropost.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
	 @user=current_user
	 @edital=Edital.find(params[:edital_id])
    @micropost = @edital.micropost.find(params[:id])
  end

  def create

	 @user=current_user
	 @edital=Edital.find(params[:micropost][:edital_id])
    @micropost = @edital.micropost.new(params[:micropost])

    respond_to do |format|
      if @micropost.save
	 		@microposts=@edital.micropost.scoped.paginate(:page => params[:page], :per_page=>5)
        format.html { redirect_to(@edital) }
		  format.js
      else
        format.html { render :action => "new" }
        format.js
      end
    end
  end

  def update
	 @user=current_user
	 @edital=Edital.find(params[:edital_id])
    @micropost = @edital.micropost.find(params[:id])

    respond_to do |format|
      if @micropost.update_attributes(params[:micropost])
        format.html { redirect_to([@edital,@micropost]) }
        format.js
      else
        format.html { render :action => "edit" }
        format.js
      end
    end
  end

  def destroy

	 @user=current_user
	 @edital=Edital.find(params[:edital_id])
    @micropost = @edital.micropost.find(params[:id])

    @micropost.destroy

    respond_to do |format|
      format.html { redirect_to(edital_microposts_url) }
      format.js
    end
  end
end
