#class UsersController < ApplicationController::Base

#  respond_to :html, :xml, :json

#  def index
#    respond_with(@users = User.all)
#  end

#  def create
#    @user = User.create(params[:user])
#    respond_with(@user, :location => users_url)
#  end
#end

class LocationsController < ApplicationController

  respond_to :html, :xml, :json

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
    respond_with( @locations )
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @location = Location.find( params[ :id ] )
    respond_with( @location )
  end

  # GET /locations/new
  # GET /locations/new.json
  def new
    @location = Location.new
    respond_with( @location )
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find( params[ :id ] )
    respond_with( @location )
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new( params[ :location ] )

    respond_with( @location ) do |format|
      if @location.save
        flash[ :notice ] = "Location was created successfully."
        format.html { redirect_to @location }
      else
        format.html { render :action => :new }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.json
  def update
    @location = Location.find( params[ :id ] )

    respond_with( @location ) do |format|
      if @location.update_attributes( params[ :location ] )
        flash[ :notice ] = "Location was successfully updated."
        format.html { redirect_to @location }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location = Location.find( params[ :id ] )
    @location.destroy

    respond_with( @location ) do |format|
      format.html { redirect_to locations_url }
      format.json { head :no_content }
    end
  end
end
