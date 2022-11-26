class Usercommit < ApplicationRecord
  belongs_to :user
  belongs_to :wishlist
  belongs_to :gift
  belongs_to :event
end
