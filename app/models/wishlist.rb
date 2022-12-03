class Wishlist < ApplicationRecord
  belongs_to :event
  has_many :gifts_wishlists, dependent: :destroy
  has_many :gifts, through: :gifts_wishlists
  has_one :usercommit
end
