json.extract! invoice, :id, :payment_date, :description, :payment_term_id, :client_name, :client_email, :status, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
