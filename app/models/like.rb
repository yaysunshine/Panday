class Like < ActiveRecord::Base
  validates :user_id, :photo_id, presence :true
  validates :user_id, :photo_id, uniqueness :true

  belongs_to :user
  has_one :photo
end
