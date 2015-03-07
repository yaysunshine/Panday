class Photo < ActiveRecord::Base
  validates :url, presence :true
  validates :url, uniqueness :true

  belongs_to :like
end
