class PageItemsController < ApplicationController
  layout 'admin', :except => ['show']
  before_filter :authenticate_user!, :except => ['show']

  def show
  end

  def new
    @page_item = PageItem.new
    @page_item.page = Page.new
  end


  def create
    @page_item = PageItem.new params[:page_item]
    if @page_item.save
      redirect_to pages_url
    else
      render action: 'new'
    end
  end


  def edit
    @page_item = PageItem.find(params[:id])
  end


  def update
    @page_item = PageItem.find(params[:id])
    if @page_item.update_attributes(params[:page_item])
      redirect_to pages_url
    else
      render action: 'edit'
    end
  end

end
