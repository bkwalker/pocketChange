class ItemsController < ApplicationController
  load_and_authorize_resource
  # GET /items
  # GET /items.json
  def index
    #@items = Item.all
    @filterrific = Filterrific.new(Item, params[:filterrific] || session[:filterrific_items])
    @filterrific.select_options = {sorted_by: Item.options_for_sorted_by}
    @items = Item.filterrific_find(@filterrific).page(params[:page])
    session[:filterrific_items] = @filterrific.to_hash
    
    respond_to do |format|
      format.html
      format.js
    end

    rescue ActiveRecord::RecordNotFound => e
      # There is an issue with the persisted param_set. Reset it.
      puts "Had to reset filterrific params: #{ e.message }"
      redirect_to(action: :reset_filterrific, format: :html) and return
  end


  def reset_filterrific
    # Clear session persistence
    session[:filterrific_items] = nil
    # Redirect back to the index action for default filter settings.
    redirect_to action: :index
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
    @offer = Offer.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    # if current_user
      @item = Item.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @item }
      end
    # else
      # redirect_to home_path, notice: 'You have to be logged in to post an item.'
    # end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end
end
