json.extract! product, :id, :product_name, :description, :color, :size, :quantity, :price, :category_id, :created_at, :updated_at
json.url product_url(product, format: :json)
