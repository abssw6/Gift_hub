class Gift < ApplicationRecord
  has_and_belongs_to_many :wishlists
end
