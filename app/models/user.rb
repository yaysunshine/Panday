class User < ActiveRecord::Base
  validates :name, :phone_number, :instagram_id, uniqueness: true
  validates :name, :phone_number, :instagram_id, presence: true

  has_many :likes
  has_many :photos, through: :likes
end
