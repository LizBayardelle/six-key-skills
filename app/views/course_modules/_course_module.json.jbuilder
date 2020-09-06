json.extract! course_module, :id, :title, :description, :course_id, :active, :created_at, :updated_at
json.url course_module_url(course_module, format: :json)
