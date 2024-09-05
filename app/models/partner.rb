# == Schema Information
#
# Table name: partners
#
#  id                  :bigint           not null, primary key
#  desc                :text(65535)
#  image_data          :text(65535)
#  name                :string(255)
#  position            :integer
#  url                 :text(65535)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  partner_category_id :bigint
#
# Indexes
#
#  index_partners_on_partner_category_id  (partner_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (partner_category_id => partner_categories.id)
#
class Partner < ApplicationRecord
    belongs_to :partner_category, optional: true
    include PartnerImageUploader::Attachment(:image)

    def self.fetch_all_partner query=nil
        if query.present?
            return Partner.where("name LIKE ?", "#{query}%")
        else
            return Partner.all
        end
    end

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


    # Method to import partners from a folder of images
  def self.import_from_folder(folder_path = 'public/images/Partners_logo_new/solutions_provider')
    uploader = PartnerImageUploader.new(:store) # Assuming you're using CarrierWave or similar

    # Ensure the folder exists
    unless File.directory?(folder_path)
      puts "Folder not found: #{folder_path}"
      return
    end

    # Loop over all image files in the folder
    Dir.foreach(folder_path) do |file_name|
      # Skip non-image files and directories
      next if file_name == '.' || file_name == '..'

      begin
        # Extract the file name without extension as the partner's name
        partner_name = File.basename(file_name, File.extname(file_name))

        # Find or initialize the partner record by name
        partner = Partner.find_or_initialize_by(name: partner_name)
        
        # Handle image upload and storage
        image_path = File.join(folder_path, file_name)
        
        if File.exist?(image_path)
          file = File.open(image_path)

          if file.present?
            # Upload the image file using the uploader and store the image_data
            uploaded_file = uploader.upload(file)
            partner.image_data = uploaded_file.to_json  # Assuming you want to store JSON metadata of the file
            partner.image_derivatives!  # Generate any required image derivatives (optional, based on uploader)
          end
        end

        # Save the partner record
        partner.save!
        puts "Successfully saved partner: #{partner.name}"

      rescue Errno::ENOENT => e
        Rails.logger.error "File not found: #{image_path} - #{e.message}"
      rescue => e
        Rails.logger.error "Failed to process partner #{partner_name}: #{e.message}"
      end
    end
  end


end
