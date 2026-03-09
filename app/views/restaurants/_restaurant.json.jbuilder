json.extract! restaurant, :id, :user_id, :name, :genre, :rating, :comment, :visited_at, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
