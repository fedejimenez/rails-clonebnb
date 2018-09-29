class ListingImagesController < ApplicationController
  before_action :set_listing_image, only: [:show, :edit, :update, :destroy]
  # before_action :set_listing_image

  # GET /listing_images
  # GET /listing_images.json
  def index
    @listing_images = ListingImage.all
  end

  # GET /listing_images/1
  # GET /listing_images/1.json
  def show
    @listing_images = @listing_image.all
      # @listing_image = ListingImage.find(params[:id])
  end

  # GET /listing_images/new
  def new
    @listing_image = ListingImage.new
  end

  # GET /listing_images/1/edit
  def edit
  end

  # POST /listing_images
  # POST /listing_images.json
  def create
    @listing = Listing.find(params[:listing_id])
    @listing_image = ListingImage.new(listing_image_params)
    @listing_image.listing_id = params[:listing_id]


    respond_to do |format|
      if @listing_image.save
        format.html { redirect_to edit_listing_path(params[:listing_id]), notice: 'Listing image was successfully created.' }
        format.json { render :show, status: :created, location: @listing_image }
      else
        format.html { render :new }
        format.json { render json: @listing_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listing_images/1
  # PATCH/PUT /listing_images/1.json
  def update
    respond_to do |format|
      if @listing_image.update(listing_image_params)
        format.html { redirect_to edit_listing_path(params[:listing_id]), notice: 'Listing image was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing_image }
      else
        format.html { render :edit }
        format.json { render json: @listing_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listing_images/1
  # DELETE /listing_images/1.json
  def destroy
    # respond_to do |format|
    #   format.html { redirect_back edit_listing_path(params[:listing_id]), notice: 'Listing image was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
    listing = @listing_image.listing_id
    @listing = Listing.find(listing)
    @listing_image.destroy
    @listing.listing_images = ListingImage.where(listing_id: listing)
    respond_to :js
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing_image
      @listing_image = ListingImage.find(params[:id])
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_image_params
      params.require(:listing_image).permit(:listing_id, :title, :description, :image, :local_image_url, :remote_image_url)
    end
end