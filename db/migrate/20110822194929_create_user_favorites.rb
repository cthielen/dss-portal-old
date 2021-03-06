class CreateUserFavorites < ActiveRecord::Migration
  def self.up
    create_table :user_favorites do |t|
      t.string :user_id
      t.string :name
      t.string :url
      t.integer :order

      t.timestamps
    end
  end

  def self.down
    drop_table :user_favorites
  end
end
