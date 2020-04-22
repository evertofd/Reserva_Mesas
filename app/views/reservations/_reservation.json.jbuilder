json.extract! reservation, :id, :start_date, :quantity, :telephone, :commentary, :created_at, :updated_at, :start, :title
json.set! :editable, reservation.editable?
