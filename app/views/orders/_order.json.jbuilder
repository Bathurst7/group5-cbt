json.extract! order, :id, :customer_id, :order_date, :total_amount, :status, :staff_id, :created_at, :updated_at
json.url order_url(order, format: :json)
