class NewsItemsController < ApplicationController

  layout 'admin', :except => ['show', 'news', 'archives']



  def news
    #need to add pagination
    @news_items = NewsItem.all
    render :layout => 'front'
  end


  def archives
    @news_items = {}
    NewsItem.all.each do |news_item|
      year = news_item.published_date.year
      if @news_items.has_key?(year)
        @news_items[year] << news_item
      else
        @news_items[year] = [news_item]
        
      end

    end
    render :layout => 'front'

  end

  # GET /news_items
  # GET /news_items.json
  def index
    @news_items = NewsItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @news_items }
    end
  end

  # GET /news_items/1
  # GET /news_items/1.json
  def show
    @news = NewsItem.find(params[:id])

    respond_to do |format|
      format.html {render :layout => 'front'}
      format.json { render json: @news }
    end
  end

  # GET /news_items/new
  # GET /news_items/new.json
  def new
    @news = NewsItem.new
    @url = {:controller => 'news_items', :action=>'create'}
    @method = 'POST'
    @news.file_uploads.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @news }
    end
  end

  # GET /news_items/1/edit
  def edit
    @news = NewsItem.find(params[:id])
    @url = news_path(@news)
    @method = 'PUT'
    @news.file_uploads.build
  end

  # POST /news_items
  # POST /news_items.json
  def create
    @news = NewsItem.new(params[:news_item])

    respond_to do |format|
      if @news.save
        format.html { redirect_to news_url(@news), notice: 'News item was successfully created.' }
        format.json { render json: @news, status: :created, location: @news }
      else
        format.html { render action: "new" }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /news_items/1
  # PUT /news_items/1.json
  def update
    @news = NewsItem.find(params[:id])

    respond_to do |format|
      if @news.update_attributes(params[:news_item])
        format.html { redirect_to news_url(@news), notice: 'News item was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news_items/1
  # DELETE /news_items/1.json
  def destroy
    @news = NewsItem.find(params[:id])
    @news.destroy

    respond_to do |format|
      format.html { redirect_to news_url }
      format.json { head :ok }
    end
  end
end
