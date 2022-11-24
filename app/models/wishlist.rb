class Wishlist < ApplicationRecord
  belongs_to :event
  has_and_belongs_to_many :gifts
end
