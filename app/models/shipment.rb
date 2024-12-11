class Shipment < ApplicationRecord
  # Associations
  belongs_to :order
  belongs_to :staff

  # Validations
  validates :shipping_date, presence: true
  validates :address, presence: true, length: { maximum: 250 }
  validates :status, presence: true, inclusion: { in: %w[pending shipped delivered], message: "must be pending, shipped, or delivered" }
  
  def display_order_details
    "##{id} - #{customer.full_name} - #{order_date.strftime('%Y-%m-%d')}"
  end
end