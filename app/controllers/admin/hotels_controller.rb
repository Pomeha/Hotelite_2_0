class Admin::HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]

  # GET /admin/hotels
  # GET /admin/hotels.json
  def index
    @hotels = Hotel.order(created_at: :desc).page(params[:page])
  end

  # GET /admin/hotels/1
  # GET /admin/hotels/1.json
  def show
    @hotel = Hotel.find(params[:id])
  end

  # GET /admin/hotels/new
  def new
    @hotel = Hotel.new
  end

  # GET /admin/hotels/1/edit
  def edit
    @hotel = Hotel.find(params[:id])
  end

  # POST /admin/hotels
  # POST /admin/hotels.json
  def create
    @hotel = Hotel.new(hotel_params)

    respond_to do |format|
      if @hotel.save
        format.html { redirect_to [:admin, @hotel], notice: 'Hotel was successfully created.' }
        format.json { render action: 'show', status: :created, location: @hotel }
      else
        format.html { render action: 'new' }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/hotels/1
  # PATCH/PUT /admin/hotels/1.json
  def update
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html { redirect_to [:admin, @hotel], notice: 'Hotel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/hotels/1
  # DELETE /admin/hotels/1.json
  def destroy
    @hotel.destroy
    respond_to do |format|
      format.html { redirect_to admin_hotels_url, notice: 'Hotel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hotel_params
      params.require(:hotel).permit(:name, :star, :address, :description, :price, :room, :breakfes)
    end
end
