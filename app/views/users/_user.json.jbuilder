json.extract! user, :id, :email, :password_digest, :name, :last_name, :phone, :location, :schedule, :hour, :kind, :created_at, :updated_at
json.url user_url(user, format: :json)
