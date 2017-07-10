class Api::V1::HotelsController < ApplicationController
  respond_to :json
  serialization_scope :view_context

  def index
    hotels = Hotel.all
    render json: hotels, status: 200, each_serializer: HotelSerializer
  end
end
