json.extract! enquiry, :id, :name, :email, :phone_number, :enquiry_type, :created_at, :updated_at
json.url enquiry_url(enquiry, format: :json)
