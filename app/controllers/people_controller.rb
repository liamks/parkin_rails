class PeopleController < ApplicationController
  layout 'admin', :except => ['show']
  before_filter :authenticate_user!, :except => ['show']
  def show
    @people = Person.first
    render :layout => 'front'
  end

  def edit
    @people = Person.first
  end

  def update
    @people = Person.first
    if @people.update_attributes(params[:person])
      redirect_to pages_url
    else
      render :action => 'edit'
    end
  end

end
