class Event < ApplicationRecord
  CATEGORIES = ["Birthday", "Wedding", "Babyshower", "Graduation", "Funeral", "Breakup", "No Reason"]
  belongs_to :user
  has_one :chatroom
  has_one :wishlist, dependent: :destroy
  has_one :usercommit, through: :wishlist, dependent: :destroy
  has_many :invitations, dependent: :destroy

  validates :event_date, presence: true
  validates :title, presence: true
  validates :category, presence: true
  validates_inclusion_of :category, in: CATEGORIES
end
