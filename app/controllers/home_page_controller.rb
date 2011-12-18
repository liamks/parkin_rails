class HomePageController < ApplicationController
  before_filter :get_home_page

  layout 'admin', :except => ['show']
  

  def show
    render :layout => 'front'
  end

  def edit
    @hp.file_uploads.build
  end

  def update
    photos = params[:home_page][:file_uploads_attributes]
    photos.delete_if {|k,v| (!v.has_key?('id') && !v.has_key?('upload')) || (v.has_key?('id') && ! v.has_key?('name'))}
    params[:home_page][:file_uploads_attributes] = photos


    @hp.update_attributes(params[:home_page])

    
    if @hp.save
      redirect_to root_url
    else
      render action: 'edit'
    end
  end

  protected

  def get_home_page
    @hp= HomePage.first
  end
end
