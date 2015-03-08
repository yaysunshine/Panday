class ChangePhotos < ActiveRecord::Migration
  def change
    add_column :photos, :like_id, :integer
  end
end
