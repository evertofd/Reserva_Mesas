json.extract! reservation, :id, :start_date, :quantity, :telephone, :commentary, :created_at, :updated_at, :start, :title
json.url reservation_url(reservation, format: :json)
