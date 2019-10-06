json.extract! blog, :id, :title, :teaser, :body, :motivation, :mindset, :resourcing, :planning, :time_management, :discipline, :image_url, :pinterest_description, :published, :published_at, :featured, :lead_magnet_id, :user_id, :created_at, :updated_at
json.url blog_url(blog, format: :json)
