json.extract! line_item, :id, :invoice_id, :name, :quantity, :price, :created_at, :updated_at
json.url line_item_url(line_item, format: :json)
