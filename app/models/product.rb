class Product < ActiveRecord::Base

  monetize :price_cents, disable_validation: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :reviews

  validates :name, presence: true
  validates :price, presence: true, numericality: true
  validates :quantity, presence: true
  validates :category, presence: true

end
