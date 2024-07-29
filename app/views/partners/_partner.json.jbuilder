json.extract! partner, :id, :name, :desc, :image_data, :position, :url, :created_at, :updated_at
json.url partner_url(partner, format: :json)
