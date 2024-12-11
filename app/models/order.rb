class Order < ApplicationRecord
  # Associations
  belongs_to :customer
  belongs_to :staff
  has_many :order_items, dependent: :destroy
  has_one :shipment, dependent: :destroy

  # Validations
  validates :order_date, presence: true
  validates :total_amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :status, presence: true, inclusion: { in: %w[pending completed canceled], message: "must be pending, completed, or canceled" }
  validate :order_date_cannot_be_in_the_future

  # Custom method to display formatted order details
  def display_order_details
    "##{id} - #{customer.full_name} - #{order_date.strftime('%Y-%m-%d')}"
  end

  private

  # Custom validation method
  def order_date_cannot_be_in_the_future
    if order_date.present? && order_date > Time.now
      errors.add(:order_date, "cannot be in the future")
    end
  end
end