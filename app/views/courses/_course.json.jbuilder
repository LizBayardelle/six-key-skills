json.extract! course, :id, :name, :price, :active, :user_id, :created_at, :updated_at
json.url course_url(course, format: :json)
