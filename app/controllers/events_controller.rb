class EventsController < ApplicationController
  # GET /events
  # GET /events.xml
  def index
    @events = Event.find(:all,:order=>'created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new
    NO_OF_IMAGES.times {@event.event_uploads.build}
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
     if @event.event_uploads.count != NO_OF_IMAGES
      @event.event_uploads.count + ( NO_OF_IMAGES - @event.event_uploads.count).times{@event.event_uploads.build}
    end
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to(events_path, :notice => 'Event was successfully created.') }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        NO_OF_IMAGES.times {@event.event_uploads.build}
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to(events_path, :notice => 'Event was successfully updated.') }
        format.xml  { head :ok }
      else
        if @event.event_uploads.count != NO_OF_IMAGES
      @event.event_uploads.count + ( NO_OF_IMAGES - @event.event_uploads.count).times{@event.event_uploads.build}
    end
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end

  def delete_image
    @upload = EventUpload.find_by_id(params[:id])
    @upload.destroy

  end
end

