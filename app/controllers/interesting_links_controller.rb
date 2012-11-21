class InterestingLinksController < ApplicationController
  # GET /interesting_links
  # GET /interesting_links.xml
  def index
    @interesting_links = InterestingLink.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @interesting_links }
    end
  end

  # GET /interesting_links/1
  # GET /interesting_links/1.xml
  def show
    @interesting_link = InterestingLink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @interesting_link }
    end
  end

  # GET /interesting_links/new
  # GET /interesting_links/new.xml
  def new
    @interesting_link = InterestingLink.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @interesting_link }
    end
  end

  # GET /interesting_links/1/edit
  def edit
    @interesting_link = InterestingLink.find(params[:id])
  end

  # POST /interesting_links
  # POST /interesting_links.xml
  def create
    @interesting_link = InterestingLink.new(params[:interesting_link])

    respond_to do |format|
      if @interesting_link.save
        format.html { redirect_to(interesting_links_path, :notice => 'InterestingLink was successfully created.') }
        format.xml  { render :xml => @interesting_link, :status => :created, :location => @interesting_link }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @interesting_link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /interesting_links/1
  # PUT /interesting_links/1.xml
  def update
    @interesting_link = InterestingLink.find(params[:id])

    respond_to do |format|
      if @interesting_link.update_attributes(params[:interesting_link])
        format.html { redirect_to(interesting_links_path, :notice => 'InterestingLink was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @interesting_link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /interesting_links/1
  # DELETE /interesting_links/1.xml
  def destroy
    @interesting_link = InterestingLink.find(params[:id])
    @interesting_link.destroy

    respond_to do |format|
      format.html { redirect_to(interesting_links_url) }
      format.xml  { head :ok }
    end
  end
end

