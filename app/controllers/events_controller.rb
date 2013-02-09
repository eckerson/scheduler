class EventsController < ApplicationController

  respond_to :html, :xml, :json

  before_filter :only => [:new, :create] do
    @event = Event.new params[ :event ]
  end

  before_filter :only => [:edit, :update, :show, :destroy] do
    @event = Event.find( params[ :id ] )
  end

  before_filter :init_location_select, :only => [:new, :create, :edit, :update]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    respond_with( @events )
  end

  # GET /events/1
  # GET /events/1.json
  def show
    respond_with( @event )
  end

  # GET /events/new
  # GET /events/new.json
  def new
    respond_with( @event )
  end

  # GET /events/1/edit
  def edit
    @locations = Location.all
    respond_with( @event )
  end

  # POST /events
  # POST /events.json
  def create
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
    @event.destroy

    respond_with( @event ) do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

private
  def init_location_select
    @locations = Location.all
    @location_select = [ [ "Select a Location", "" ] ]

    @locations.each do |location|
    	@location_select << [ location.name, location.id ]
    end
  end
end
