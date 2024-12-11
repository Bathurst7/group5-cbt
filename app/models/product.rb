class Product < ApplicationRecord
  # Associations
  belongs_to :category
  has_many :order_items, dependent: :destroy

  # Validations
  validates :product_name, presence: true, length: { maximum: 150 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, length: { maximum: 500 }, allow_blank: true
  validates :color, length: { maximum: 50 }, allow_blank: true
  validates :size, length: { maximum: 50 }, allow_blank: true
end
