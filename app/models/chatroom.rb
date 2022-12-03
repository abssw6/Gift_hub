class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :event
end

# migrations refernces event to chat
# after create event create chat room and give event id
# update link_to
