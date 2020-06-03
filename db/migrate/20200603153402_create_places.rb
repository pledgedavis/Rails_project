class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.string :location
      t.string :description
      t.string :overall_rating
      t.string :category
 
      t.timestamps
    end
  end
end
