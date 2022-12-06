class Event < ApplicationRecord
  CATEGORIES = ["Birthday", "Wedding", "Babyshower", "Covid", "Funeral", "Breakup", "No Reason"]
  belongs_to :user
  has_one :wishlist
  has_one :chatroom
  validates :event_date, presence: true

  validates :title, presence: true
  validates :category, presence: true
  validates_inclusion_of :category, in: CATEGORIES

  has_many :invitations

  # after_create :create_chatroom

  # def create_chatroom
  #   self.chatroom.create!(name: "Chatroom", user_id: self.id)
  # end
end
