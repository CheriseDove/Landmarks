json.extract! landmark, :id, :image_url, :name, :location, :description, :price, :created_at, :updated_at
json.url landmark_url(landmark, format: :json)
