class CreateRestaurants < ActiveRecord::Migration[7.2]
  def change
    create_table :restaurants do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :genre
      t.integer :rating
      t.text :comment
      t.date :visited_at

      t.timestamps
    end
  end
end
