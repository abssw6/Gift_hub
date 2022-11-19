class Event < ApplicationRecord
  CATEGORIES= ["Birthday", "Wedding", "Covid", "Funeral", "Breakup"]
  belongs_to :user

  validates :eventdate, presence: true
  validates :title, presence: true
  validates :category, presence: true
  validates_inclusion_of :category, in: CATEGORIES
end
