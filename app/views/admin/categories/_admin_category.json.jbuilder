json.extract! admin_category, :id, :name, :image_data, :description, :code, :created_at, :updated_at
json.url admin_category_url(admin_category, format: :json)
