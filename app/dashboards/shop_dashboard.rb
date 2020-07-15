require "administrate/base_dashboard"

class ShopDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    area: Field::BelongsTo,
    historis: Field::HasMany,
    clips: Field::HasMany,
    woms: Field::HasMany,
    shop_genres: Field::HasMany,
    shop_brands: Field::HasMany,
    shop_users: Field::HasMany,
    genres: Field::HasMany,
    brands: Field::HasMany,
    users: Field::HasMany,
    shop_images: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    outline: Field::Text,
    address: Field::String,
    latitude: Field::Number.with_options(decimals: 2),
    longitude: Field::Number.with_options(decimals: 2),
    phone_number: Field::String,
    postal_code: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  user
  area
  historis
  clips
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  user
  area
  historis
  clips
  woms
  shop_genres
  shop_brands
  shop_users
  genres
  brands
  users
  shop_images
  id
  name
  outline
  address
  latitude
  longitude
  phone_number
  postal_code
  created_at
  updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  user
  area
  historis
  clips
  woms
  shop_genres
  shop_brands
  shop_users
  genres
  brands
  users
  shop_images
  name
  outline
  address
  latitude
  longitude
  phone_number
  postal_code
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how shops are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(shop)
  #   "Shop ##{shop.id}"
  # end
end
