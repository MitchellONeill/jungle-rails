class Review < ActiveRecord::Base

belongs_to :product
belongs_to :user


validates :product, presence: true
validates :user_id, presence: true
validates :rating, presence: true, numericality: {
  only_ineger: true,
  greater_than_or_equal_to: 0,
  less_than_or_equal_to: 5
}
validates :description, presence: true, length: { minimum: 8, maximum: 300 }

end
