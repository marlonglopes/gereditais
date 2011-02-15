class ItemsController < ApplicationController

	def index

#	 @items = Item.all.paginate(:page => params[:page], :per_page=>20)

	 @items = Item.all(:params => {:page => 2, :per_page => 5})

	end

end
