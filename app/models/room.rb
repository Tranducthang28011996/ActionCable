class Room < ApplicationRecord
  has_many :rooms_users
  has_many :users, through: :rooms_users
  has_many :messages, dependent: :destroy
  accepts_nested_attributes_for :messages
end
