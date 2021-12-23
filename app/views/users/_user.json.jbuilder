json.extract! user, :id, :f_name, :s_name, :username, :email, :password_digest, :created_at, :updated_at
json.url user_url(user, format: :json)
