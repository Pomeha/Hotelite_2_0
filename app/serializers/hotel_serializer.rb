class HotelSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :star, :room, :created_at
end
