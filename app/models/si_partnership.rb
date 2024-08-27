# == Schema Information
#
# Table name: si_partnerships
#
#  id           :bigint           not null, primary key
#  address1     :text(65535)
#  address2     :text(65535)
#  address3     :text(65535)
#  code         :string(255)
#  desc         :text(65535)
#  email_one    :string(255)
#  email_three  :string(255)
#  email_two    :string(255)
#  image_data   :text(65535)
#  name         :string(255)
#  phone_one    :string(255)
#  phone_three  :string(255)
#  phone_two    :string(255)
#  status       :boolean          default(TRUE)
#  website_link :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class SiPartnership < ApplicationRecord
    include SystemIntegratorPartnershipImageUploader::Attachment(:image)
    has_many :system_integrators
    require 'roo'

    def self.import_from_excel file_path = 'downloads/si_manu.xlsx'
        spreadsheet = Roo::Spreadsheet.open(file_path)
        header = spreadsheet.row(1)

        uploader = SystemIntegratorPartnershipImageUploader.new(:store)

        base_url = 'https://marketplace.mosip.io/wp-content/'
      
        (2..spreadsheet.last_row).each do |i|
          row = Hash[[header, spreadsheet.row(i)].transpose]
                  
          begin
            partner = SiPartnership.find_or_initialize_by(name: row['name'])
            partner.email_one = row['email_one']
            partner.email_two = row['email_two']
            partner.email_three = row['email_three']
            partner.phone_one = row['phone_one']
            partner.phone_two = row['phone_two']
            partner.phone_three = row['phone_three']
            partner.address1 = row['address_line_1']
            partner.address2 = row['address_line_2']
            partner.address3 = row['address_line_3']
            partner.desc = row['desc']
            partner.website_link = row['website_link']
            if row['image'].present?

                file_path = row['image'].gsub(base_url, '') # Remove the base URL
                begin
    
                  file = File.open(Rails.root.join('public/images/product', file_path)) # Open the file
        
                  if file.present?
                    uploaded_file = uploader.upload(file)
                    partner.image_data = uploaded_file.to_json
                    partner.image_derivatives!
                  end
                  
                rescue Errno::ENOENT => e
                  Rails.logger.error "File not found: #{full_file_path} - #{e.message}"
                end
            end
            partner.save!
          rescue => e
            Rails.logger.error "Row #{i}: #{e.message}"
          end
        end
      end
end
