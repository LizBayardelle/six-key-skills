json.extract! quiz, :id, :name, :slug, :description, :result, :user_id, :created_at, :updated_at
json.url quiz_url(quiz, format: :json)
