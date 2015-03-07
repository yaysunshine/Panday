class ChangePhotos < ActiveRecord::Migration
  def change
    add_column :like_id, :integer
  end
end
