class HomePageController < ApplicationController
  before_filter :get_home_page

  layout 'admin', :except => ['show']
  before_filter :authenticate_user!, :except => ['show']

  def show
    render :layout => 'front'
  end

  def edit
    @hp.file_uploads.build
  end

  def update
    if @hp.update_attributes(params[:home_page])
      if params[:home_page][:redirect_url].empty?
        redirect_to pages_url
      else
        @hp.file_uploads.build
        render action: 'edit'
      end
    else
      render action: 'edit'
    end
  end

  protected

  def get_home_page
    @hp= HomePage.first
  end
end
