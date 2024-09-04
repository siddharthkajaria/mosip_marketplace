# == Schema Information
#
# Table name: system_integrators
#
#  id                   :bigint           not null, primary key
#  desc                 :text(65535)
#  image_data           :text(65535)
#  name                 :string(255)
#  partnership_validity :date
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  si_partnership_id    :bigint           not null
#
# Indexes
#
#  index_system_integrators_on_si_partnership_id  (si_partnership_id)
#
# Foreign Keys
#
#  fk_rails_...  (si_partnership_id => si_partnerships.id)
#
class SystemIntegrator < ApplicationRecord
  include SystemIntegratorImageUploader::Attachment(:image)
  belongs_to :si_partnership, optional: true
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

  def self.import_from_excel file_path = 'downloads/si_prod.xlsx'
    # file_path = 'downloads/pdt_new.xlsx'
    spreadsheet = Roo::Spreadsheet.open(file_path)
    header = spreadsheet.row(1).map(&:strip) # Remove any leading/trailing spaces from headers
    uploader = SystemIntegratorImageUploader.new(:store)

    base_url = 'https://marketplace.mosip.io/wp-content/'

    (2..spreadsheet.last_row).each do |i|
      row_data = spreadsheet.row(i)
      row = Hash[header.zip(row_data).map { |h, v| [h.strip, v] }]

      manufacturer = SiPartnership.find_by(name: row['manufacturer'])
      if !manufacturer.present?
        manufacturer = SiPartnership.create!(name:row['manufacturer'])
      end

      begin
        product = SystemIntegrator.find_or_initialize_by(name: row['name'])
        product.desc = row['short_description'] if row['short_description'] != nil
        product.si_partnership = manufacturer if manufacturer

        

        if row['image'].present?
          deserialized_images = PHP.unserialize(row['image']) # Deserialize the image field
  
          deserialized_images.each_with_index do |image_data, index|
            file_path = image_data['prod_gallery'].gsub(base_url, '') # Remove the base URL
            begin

              file = File.open(Rails.root.join('public/images/product', file_path)) # Open the file
    
              if file.present?
                uploaded_file = uploader.upload(file)
                product.image_data = uploaded_file.to_json
                
                product.image_derivatives!
              end
              product.save!
            rescue Errno::ENOENT => e
              Rails.logger.error "File not found: #{full_file_path} - #{e.message}"
            end
          end
        end

        product.save!
      rescue => e
        Rails.logger.error "Row #{i}: #{e.message}"
      end
    end
  end

  def self.filtered_system_integrators(params, integrators)
    if integrators.present?
      all_integrators = integrators
    else
      all_integrators = SystemIntegrator.all
    end

    if params[:si_partnerships].present?
      si_partnership_ids = params[:si_partnerships].uniq
      all_integrators = all_integrators.where(si_partnership_id: si_partnership_ids)
    end

    all_integrators
  end


  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "desc", "id", "image_data", "name", "partnership_validity", "si_partnership_id", "updated_at"]
  end

  

end
