class AwardsController < ApplicationController
  layout 'admin', :except => ['show']
  before_filter :authenticate_user!, :except => ['show']
  def show
    @awards = Awards.first
    render :layout => 'front'
  end

  def edit
    @awards = Awards.first
  end

  def update
    @awards = Awards.first
    if @awards.update_attributes(params[:awards])
      redirect_to pages_url
    else
      render :action => 'edit'
    end
  end
end
