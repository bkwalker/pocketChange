class BookDetailsController < ApplicationController
  # GET /book_details
  # GET /book_details.json
  def index
    @book_details = BookDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @book_details }
    end
  end

  # GET /book_details/1
  # GET /book_details/1.json
  def show
    @book_detail = BookDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book_detail }
    end
  end

  # GET /book_details/new
  # GET /book_details/new.json
  def new
    @book_detail = BookDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book_detail }
    end
  end

  # GET /book_details/1/edit
  def edit
    @book_detail = BookDetail.find(params[:id])
  end

  # POST /book_details
  # POST /book_details.json
  def create
    @book_detail = BookDetail.new(params[:book_detail])

    respond_to do |format|
      if @book_detail.save
        format.html { redirect_to @book_detail, notice: 'Book detail was successfully created.' }
        format.json { render json: @book_detail, status: :created, location: @book_detail }
      else
        format.html { render action: "new" }
        format.json { render json: @book_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /book_details/1
  # PUT /book_details/1.json
  def update
    @book_detail = BookDetail.find(params[:id])

    respond_to do |format|
      if @book_detail.update_attributes(params[:book_detail])
        format.html { redirect_to @book_detail, notice: 'Book detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_details/1
  # DELETE /book_details/1.json
  def destroy
    @book_detail = BookDetail.find(params[:id])
    @book_detail.destroy

    respond_to do |format|
      format.html { redirect_to book_details_url }
      format.json { head :no_content }
    end
  end
end
