require "administrate/base_dashboard"

class HotelDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    reviews: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    star: Field::Number,
    breakfest: Field::Boolean,
    address: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    description: Field::String,
    image: Field::String,
    room: Field::Text,
    price: Field::Number,
    rate: Field::Number,
    aasm_state: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :reviews,
    :id,
    :name,
    :aasm_state
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :reviews,
    :id,
    :name,
    :star,
    :breakfest,
    :address,
    :created_at,
    :updated_at,
    :description,
    :image,
    :room,
    :price,
    :rate,
    :aasm_state,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :reviews,
    :name,
    :star,
    :breakfest,
    :address,
    :description,
    :image,
    :room,
    :price,
    :rate,
    :aasm_state,
  ].freeze

  # Overwrite this method to customize how hotels are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(hotel)
  #   "Hotel ##{hotel.id}"
  # end
end
