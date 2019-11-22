json.extract! transaction, :id, : type, :category, :location, :transaction_date, :amount, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
