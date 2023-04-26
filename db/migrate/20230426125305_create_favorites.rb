class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.string :urlToImage, null: false
      t.string :description, null: false
      t.string :content, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :favorites, :title, unique: true
  end
end
