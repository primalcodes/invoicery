json.extract! address, :id, :invoice_id, :type, :street, :city, :state, :post_code, :country, :created_at, :updated_at
json.url address_url(address, format: :json)
