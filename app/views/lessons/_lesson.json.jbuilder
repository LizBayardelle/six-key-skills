json.extract! lesson, :id, :title, :description, :body, :video, :module_id, :active, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
