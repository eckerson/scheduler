class EventsController < ApplicationController

  respond_to :html, :xml, :json

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    respond_with( @events )
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find( params[ :id ] )
    respond_with( @event )
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    @locations = Location.all
    @location_select = [ [ "Select a Location", "" ] ]

    @locations.each do |location|
    	@location_select << [ location.name, location.id ]
    end

    respond_with( @event )
  end

  # GET /events/1/edit
  def edit
    @event = Event.find( params[ :id ] )
    @locations = Location.all
    @location_select = [ [ "Select a Location", "" ] ]

    @locations.each do |location|
      @location_select << [ location.name, location.id ]
    end
    
    respond_with( @event )
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new( params[ :event ] )

    respond_with( @event ) do |format|
      if @event.save
        flash[ :notice ] = "Event was created successfully."
        format.html { redirect_to @event }
      else
        format.html { render :action => :new }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find( params[ :id ] )

    respond_with( @event ) do |format|
      if @event.update_attributes( params[ :event ] )
        flash[ :notice ] = "Event was successfully updated."
        format.html { redirect_to @event }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find( params[ :id ] )
    @event.destroy

    respond_with( @event ) do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end
