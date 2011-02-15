class ItemsController < ApplicationController

	def index

# 	 @search = Item.joins(:produto).favoravel.search(params[:search])
#	 @items = @search.order("id").scoped.paginate(:page => params[:page], :per_page=>20)

#	 @search = Item.search(params[:search])

	 @items = Item.all(:params=>{:page => params[:page] ? params[:page] : 1 , :per_page=>20})

	end

end
