json.extract! post, :id, :treatment, :comment, :price, :created_at, :updated_at
json.url post_url(post, format: :json)