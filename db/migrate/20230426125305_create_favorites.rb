class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.string :title
      t.string :url
      t.string :urlToImage
      t.text :description
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :favorites, :title
  end
end
