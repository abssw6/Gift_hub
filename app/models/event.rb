class Event < ApplicationRecord
  belongs_to :user

  validates :date, presence: true
  validates :category, presence: true
  validates :title, presence: true
end
