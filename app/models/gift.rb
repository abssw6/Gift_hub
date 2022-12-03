class Gift < ApplicationRecord
  has_and_belongs_to_many :wishlists
  has_many :usercommits
  has_one_attached :photo
end
