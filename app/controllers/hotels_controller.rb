class HotelsController < ApplicationController
  before_action :set_hotel, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # GET /hotels
  # GET /hotels.json
  def index
    @hotels = Hotel.where(status: "approved").order(created_at: :desc).page(params[:page])
  end

  # GET /hotels/1
  # GET /hotels/1.json
  def top
    @hotels = Hotel.where(status: "approved").order(rate: :desc).limit(5);
  end

  def show
    @hotel = Hotel.find(params[:id])
    if @hotel.status != "approved"
      raise ActionController::RoutingError.new('Not Found')
    end
    #@reviews = Reviews.find(params[:id]) Studying this point
  end

  # GET /hotels/new
  def new
    @hotel = Hotel.new
  end

  # GET /hotels/1/edit
  def edit
    @hotel = Hotel.find(params[:id])
    if @hotel.status != "approved"
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  # POST /hotels
  # POST /hotels.json
  def create
    @hotel = Hotel.new(hotel_params)
    @hotel.rate=0;
    @hotel.status="pending"
    @hotel.user_id = current_user.id

    respond_to do |format|
      if @hotel.save
        format.html { redirect_to hotels_path, notice: 'Hotel was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /hotels/1
  # PATCH/PUT /hotels/1.json
  def update
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html { redirect_to @hotel, notice: 'Hotel was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /hotels/1
  # DELETE /hotels/1.json
  def destroy
    @hotel.destroy
    respond_to do |format|
      format.html { redirect_to hotels_path, notice: 'Hotel was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_hotel
    @hotel = Hotel.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def hotel_params
    params.fetch(:hotel, {})
    params.require(:hotel).permit(:name, :star, :address, :description, :price, :image, :room,:breakfest)
  end
end
