class NewsItemsController < ApplicationController
  # GET /news_items
  # GET /news_items.xml
  def index
    if params[:tag_id]
    @news_items = NewsItem.find(:all, :conditions => ["tags like ?","%#{params[:tag_id]}%"],:order=>'created_at DESC')
  else
    @news_items = NewsItem.find(:all,:order=>'created_at DESC')
  end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @news_items }
    end
  end

  # GET /news_items/1
  # GET /news_items/1.xml
  def show
    @news_item = NewsItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @news_item }
    end
  end

  # GET /news_items/new
  # GET /news_items/new.xml
  def new
    @news_item = NewsItem.new
    NO_OF_IMAGES.times {@news_item.news_uploads.build}
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @news_item }
    end
  end

  # GET /news_items/1/edit
  def edit
    @news_item = NewsItem.find(params[:id])
    if @news_item.news_uploads.count != NO_OF_IMAGES
      @news_item.news_uploads.count + ( NO_OF_IMAGES - @news_item.news_uploads.count).times{@news_item.news_uploads.build}
    end
  end

  # POST /news_items
  # POST /news_items.xml
  def create
    @news_item = NewsItem.new(params[:news_item])

    respond_to do |format|
      if @news_item.save
        format.html { redirect_to(@news_item, :notice => 'NewsItem was successfully created.') }
        format.xml  { render :xml => @news_item, :status => :created, :location => @news_item }
      else
        NO_OF_IMAGES.times {@news_item.news_uploads.build}
        format.html { render :action => "new" }
        format.xml  { render :xml => @news_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /news_items/1
  # PUT /news_items/1.xml
  def update
    @news_item = NewsItem.find(params[:id])

    respond_to do |format|
      if @news_item.update_attributes(params[:news_item])
        format.html { redirect_to(@news_item, :notice => 'NewsItem was successfully updated.') }
        format.xml  { head :ok }
      else
         if @news_item.news_uploads.count != NO_OF_IMAGES
      @news_item.news_uploads.count + ( NO_OF_IMAGES - @news_item.news_uploads.count).times{@news_item.news_uploads.build}
    end
        format.html { render :action => "edit" }
        format.xml  { render :xml => @news_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /news_items/1
  # DELETE /news_items/1.xml
  def destroy
    @news_item = NewsItem.find(params[:id])
    @news_item.destroy

    respond_to do |format|
      format.html { redirect_to(news_items_url) }
      format.xml  { head :ok }
    end
  end
end

