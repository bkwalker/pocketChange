class LocationAddressesController < ApplicationController
  authorize_resource
  # GET /location_addresses
  # GET /location_addresses.json
  def index
    @location_addresses = LocationAddress.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @location_addresses }
    end
  end

  # GET /location_addresses/1
  # GET /location_addresses/1.json
  def show
    @location_address = LocationAddress.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location_address }
    end
  end

  # GET /location_addresses/new
  # GET /location_addresses/new.json
  def new
    @location_address = LocationAddress.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location_address }
    end
  end

  # GET /location_addresses/1/edit
  def edit
    @location_address = LocationAddress.find(params[:id])
  end

  # POST /location_addresses
  # POST /location_addresses.json
  def create
    @location_address = LocationAddress.new(params[:location_address])

    respond_to do |format|
      if @location_address.save
        format.html { redirect_to @location_address, notice: 'Location address was successfully created.' }
        format.json { render json: @location_address, status: :created, location: @location_address }
      else
        format.html { render action: "new" }
        format.json { render json: @location_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /location_addresses/1
  # PUT /location_addresses/1.json
  def update
    @location_address = LocationAddress.find(params[:id])

    respond_to do |format|
      if @location_address.update_attributes(params[:location_address])
        format.html { redirect_to @location_address, notice: 'Location address was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_addresses/1
  # DELETE /location_addresses/1.json
  def destroy
    @location_address = LocationAddress.find(params[:id])
    @location_address.destroy

    respond_to do |format|
      format.html { redirect_to location_addresses_url }
      format.json { head :no_content }
    end
  end
end
