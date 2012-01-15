class PagesController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  def index
    @pages = Page.all
    
  end

	def update_order
		ids = params[:pages].keys
		pages = Page.find(ids)
		pages.each do |page|
			page.order_num = params[:pages][page.id.to_s].to_i
			page.save
		end

		render nothing: true
	end

end
