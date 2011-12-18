class ServicesController < ApplicationController
  layout 'admin', :except => ['show']

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
      redirect_to :action => 'show'
    else
      render action: 'edit'
    end
  end

end
