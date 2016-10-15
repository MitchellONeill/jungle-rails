class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :product_id
      t.string :user_id
      t.string :description
      t.string :rating

      t.timestamps null: false
    end
  end
end
