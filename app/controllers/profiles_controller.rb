class ProfilesController < ApplicationController
    layout 'admin', :except => ['show']
  before_filter :authenticate_user!, :except => ['show']
  def show
    @profile = Profile.first
    render :layout => 'front'
  end

  def edit
    @profile = Profile.first
  end

  def update
    @profile = Profile.first
    if @profile.update_attributes(params[:profile])
      redirect_to pages_url
    else
      render :action => 'edit'
    end
  end

end
