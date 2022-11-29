class Wishlist < ApplicationRecord
  belongs_to :event
  has_many :gifts_wishlists
  has_many :gifts, through: :gifts_wishlists

end
