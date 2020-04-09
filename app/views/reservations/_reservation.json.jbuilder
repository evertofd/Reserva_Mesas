json.extract! reservation, :id, :date, :quantity, :telephone, :commentary, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
