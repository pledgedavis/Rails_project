class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :description
      t.string :picture 
      t.integer :count
      t.integer :rating
      t.integer :user_id
      t.integer :place_id
      t.datetime
      t.timestamps
    end
  end
end
