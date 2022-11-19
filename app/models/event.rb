class Event < ApplicationRecord
  belongs_to :user

  validates :eventdate, presence: true
  validates :category, presence: true
  validates :title, presence: true
end
