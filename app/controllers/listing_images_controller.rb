class ListingImagesController < ApplicationController
  before_action :set_listing_image, only: [:show, :edit, :update, :destroy]

  # GET /listing_images
  # GET /listing_images.json
  def index
    @listing_images = ListingImage.all
  end

  # GET /listing_images/1
  # GET /listing_images/1.json
  def show
    @listing_images = @listing.photos.all
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
    @listing_image = ListingImage.new(listing_image_params)

    respond_to do |format|
      if @listing_image.save
        format.html { redirect_to @listing_image, notice: 'Listing image was successfully created.' }
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
        format.html { redirect_to @listing_image, notice: 'Listing image was successfully updated.' }
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
    @listing_image.destroy
    respond_to do |format|
      format.html { redirect_to listing_images_url, notice: 'Listing image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing_image
      @listing_image = ListingImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_image_params
      params.require(:listing_image).permit(:listing_id, :avatar)
    end
end