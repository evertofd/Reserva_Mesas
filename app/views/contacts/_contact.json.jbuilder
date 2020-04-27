json.extract! contact, :id, :title, :email, :body, :created_at, :updated_at
json.url contact_url(contact, format: :json)
