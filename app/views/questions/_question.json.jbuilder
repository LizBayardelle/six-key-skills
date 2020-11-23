json.extract! question, :id, :measures, :text, :quiz_id, :created_at, :updated_at
json.url question_url(question, format: :json)
