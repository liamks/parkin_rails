class PagesController < ApplicationController
  layout 'admin'
  def index
    @pages = Page.all
    
  end

end
