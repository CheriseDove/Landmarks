json.extract! book_now, :id, :name, :email, :phone, :address, :created_at, :updated_at
json.url book_now_url(book_now, format: :json)
