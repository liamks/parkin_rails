class PagesController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  def index
    @pages = Page.all
    
  end

end
