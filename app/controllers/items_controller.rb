class ItemsController < ApplicationController

	def index

#	 @items = Item.all.paginate(:page => params[:page], :per_page=>20)

	 @items = Item.find(:all, :params=>{:page => params[:page] ? params[:page] : 1 , :per_page=>20})

	end

end
