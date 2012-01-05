class HistoriesController < ApplicationController
    layout 'admin', :except => ['show']
  before_filter :authenticate_user!, :except => ['show']

  def show
    @history = History.first
    render :layout => 'front'
  end

  def edit
    @history = History.first
  end

  def update
    @history = History.first
    if @history.update_attributes(params[:history])
      redirect_to pages_url
    else
      render :action => 'edit'
    end
  end

end
