class ChangeColumnReviewsRating < ActiveRecord::Migration
  def change
    change_column :reviews, :rating, 'integer USING CAST(rating AS integer)'
  end
end
