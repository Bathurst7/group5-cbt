json.extract! shipment, :id, :order_id, :shipping_date, :address, :status, :staff_id, :created_at, :updated_at
json.url shipment_url(shipment, format: :json)
