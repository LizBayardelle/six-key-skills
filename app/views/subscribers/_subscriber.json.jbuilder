json.extract! subscriber, :id, :first_name, :email, :member, :lead_magnet_id, :created_at, :updated_at
json.url subscriber_url(subscriber, format: :json)
