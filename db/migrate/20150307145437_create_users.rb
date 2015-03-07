class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone_number
      t.integer :instagram_id

      t.timestamps
    end
  end
end
