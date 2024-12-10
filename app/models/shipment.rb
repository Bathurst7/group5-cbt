class Shipment < ApplicationRecord
  belongs_to :order
  belongs_to :staff
end
