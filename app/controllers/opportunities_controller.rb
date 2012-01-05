class OpportunitiesController < ApplicationController
  layout 'admin', :except => ['show']
  before_filter :authenticate_user!, :except => ['show']
  def show
    @opportunities = Opportunity.first
    render :layout => 'front'
  end

  def edit
    @opportunities = Opportunity.first
  end

  def update
    @opportunities = Opportunity.first
    if @opportunities.update_attributes(params[:opportunity])
      redirect_to pages_url
    else
      render :action => 'edit'
    end
  end

end
