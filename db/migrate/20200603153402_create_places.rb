class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
     
      t.string :description
      t.string :overall_rating
      t.integer :category_id
      t.integer :user_id
      t.timestamps
    end
  end
end
