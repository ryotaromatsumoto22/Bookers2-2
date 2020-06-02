class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      # t.integer :user_id
      # t.integer :book_id

      t.references :user, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps

      add_index :favorites, :user_id
      add_index :favorites, :book_id
      add_index :favorites, [:user_id, :book_id], unique: true
    end
  end
end
