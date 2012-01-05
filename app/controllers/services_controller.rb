class ServicesController < ApplicationController
  layout 'admin', :except => ['show']
  before_filter :authenticate_user!, :except => ['show']
  def show
    @service = Service.first
    render :layout => 'front'
  end

  def edit
    @service = Service.first
  end

  def update
    @service = Service.first
    @service.update_attributes(params[:service])

    if @service.save
      redirect_to pages_url
    else
      render action: 'edit'
    end
  end

end
