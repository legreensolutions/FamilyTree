class ContentManagementsController < ApplicationController
  # GET /content_managements
  # GET /content_managements.xml
  def index
    @content_managements = ContentManagement.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @content_managements }
    end
  end

  # GET /content_managements/1
  # GET /content_managements/1.xml
  def show
    @content_management = ContentManagement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @content_management }
    end
  end

  # GET /content_managements/new
  # GET /content_managements/new.xml
  def new
    @content_management = ContentManagement.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @content_management }
    end
  end

  # GET /content_managements/1/edit
  def edit
    @content_management = ContentManagement.find(params[:id])
  end

  # POST /content_managements
  # POST /content_managements.xml
  def create
    @content_management = ContentManagement.new(params[:content_management])

    respond_to do |format|
      if @content_management.save
        format.html { redirect_to(content_managements_path, :notice => 'ContentManagement was successfully created.') }
        format.xml  { render :xml => @content_management, :status => :created, :location => @content_management }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @content_management.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /content_managements/1
  # PUT /content_managements/1.xml
  def update
    @content_management = ContentManagement.find(params[:id])

    respond_to do |format|
      if @content_management.update_attributes(params[:content_management])
        format.html { redirect_to(content_managements_path, :notice => 'ContentManagement was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @content_management.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /content_managements/1
  # DELETE /content_managements/1.xml
  def destroy
    @content_management = ContentManagement.find(params[:id])
    @content_management.destroy

    respond_to do |format|
      format.html { redirect_to(content_managements_url) }
      format.xml  { head :ok }
    end
  end
end

