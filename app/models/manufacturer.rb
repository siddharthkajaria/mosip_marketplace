# == Schema Information
#
# Table name: manufacturers
#
#  id           :bigint           not null, primary key
#  address1     :text(65535)
#  address2     :text(65535)
#  address3     :text(65535)
#  desc         :text(65535)
#  email_one    :string(255)
#  email_three  :string(255)
#  email_two    :string(255)
#  image_data   :text(65535)
#  name         :string(255)
#  phone_one    :string(255)
#  phone_three  :string(255)
#  phone_two    :string(255)
#  website_link :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Manufacturer < ApplicationRecord
    has_many :products

    include ManufacturerImageUploader::Attachment(:image)
    require 'roo'

    def get_image_url
        images=Hash.new 
        images['available']=self.image.present?
          if images['available']
            images['thumb']=self.image(:small).url
            images['medium']=self.image(:medium).url
          else 
            images['thumb']=self.image_url
            images['medium']=self.image_url
          end
          images['original']=self.image_url
        return images
    end

    

    def self.import_from_excel
        file_path = 'downloads/test_manu.xlsx'
        spreadsheet = Roo::Spreadsheet.open(file_path)
        header = spreadsheet.row(1)

        uploader = ManufacturerImageUploader.new(:store)
      
        (2..spreadsheet.last_row).each do |i|
          row = Hash[[header, spreadsheet.row(i)].transpose]
                  
          begin
            manufacturer = Manufacturer.find_or_initialize_by(name: row['name'])
            manufacturer.email_one = row['email_one']
            manufacturer.email_two = row['email_two']
            manufacturer.email_three = row['email_three']
            manufacturer.phone_one = row['phone_one']
            manufacturer.phone_two = row['phone_two']
            manufacturer.phone_three = row['phone_three']
            manufacturer.address1 = row['address_line_1']
            manufacturer.address2 = row['address_line_2']
            manufacturer.address3 = row['address_line_3']
            manufacturer.desc = row['desc']
            manufacturer.website_link = row['website_link']
            if row['image'].present?
                file = File.open("public/images/manufacturer/"+row['image'])
                if file.present?
                    uploaded_file = uploader.upload(file)
                    manufacturer.image_data = uploaded_file.to_json
                    manufacturer.image_derivatives!
                end
            end
            manufacturer.save!
          rescue => e
            Rails.logger.error "Row #{i}: #{e.message}"
          end
        end
      end
      
end
