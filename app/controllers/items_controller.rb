class ItemsController < ApplicationController

	def index

# 	 @search = Item.scoped.search(params[:search])
#	 @items = @search.order("id").scoped.paginate(:page => params[:page], :per_page=>20)

	 @items = Item.all.paginate(:page => params[:page], :per_page=>20)

	end

end
