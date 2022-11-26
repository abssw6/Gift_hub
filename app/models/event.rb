class Event < ApplicationRecord
  CATEGORIES = ["Birthday", "Wedding", "Babyshower", "Covid", "Funeral", "Breakup", "No Reason"]
  belongs_to :user

  validates :start_time, presence: true

  validates :title, presence: true
  validates :category, presence: true
  validates_inclusion_of :category, in: CATEGORIES
end
