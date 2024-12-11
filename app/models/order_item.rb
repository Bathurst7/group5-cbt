class OrderItem < ApplicationRecord
  # Associations
  belongs_to :order
  belongs_to :product

  # Validations
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :quantity_must_not_exceed_available

  # Callback to deduct product quantity
  before_save :calculate_subtotal
  after_create :deduct_product_quantity
  
  private

  # Custom validation method
  def quantity_must_not_exceed_available
    if product.present? && quantity > product.quantity
      errors.add(:quantity, "cannot be greater than available product quantity (#{product.quantity})")
    end
  end

  # Deduct product quantity after an order item is created
  def deduct_product_quantity
    product.update(quantity: product.quantity - quantity)
  end

  # Calculate subtotal based on product price and quantity
  def calculate_subtotal
    if product.present? && quantity.present?
      self.subtotal = product.price * quantity
    else
      self.subtotal = 0
    end
  end
end