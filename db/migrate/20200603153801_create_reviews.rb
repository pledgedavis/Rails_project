class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :place_id
      t.integer :count
      t.datetime
      t.timestamps
    end
  end
end
