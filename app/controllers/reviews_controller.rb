class ReviewsController < ApplicationController
  before_action :review_params, only: [:create]

  # def index
  #   if current_user.admin == true
  #     @hotels = Hotel.order(:name).page(params[:page])
  #   end
  # end

  def create
    @hotel = Hotel.find(params[:hotel_id])
    @review=@hotel.reviews.build(review_params)
    @review.user_id = current_user.id
    respond_to do |format|
      if @review.save
        @hotel.rate=@hotel.reviews.sum{|review| review.rate}/@hotel.reviews.count    
        @hotel.save
        format.html { redirect_to @hotel, notice: 'Feedback was successfully created.' }
      else
        format.html { redirect_to @hotel, notice: 'Oooops, you got some problems here :(' }
      end
    end
  end

  def destroy
    @hotel = Hotel.find(params[:hotel_id])
    @review = @hotel.reviews.find(params[:id])
    @review.destroy
    if @hotel.reviews.count>0
      @hotel.rate=@hotel.reviews.sum{|review| review.rate}/@hotel.reviews.count
    else
      @hotel.rate=0;
    end
    @hotel.save
    respond_to do |format|
      format.html { redirect_to @hotel, notice: 'Review was successfully destroyed.' }
    end
  end

  def edit
    @review = Review.find(params[:id])
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def review_params
    params.fetch(:review, {})
    params.require(:review).permit(:rate, :review, :user_id, :hotel_id)
  end
end
