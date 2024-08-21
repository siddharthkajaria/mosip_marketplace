# == Schema Information
#
# Table name: products
#
#  id                               :bigint           not null, primary key
#  additional_components            :text(65535)
#  additional_feature               :text(65535)
#  certified                        :boolean          default(FALSE)
#  firmware_version                 :string(255)
#  ftm_chip_make_and_model          :string(255)
#  full_specifications              :text(65535)
#  global_certifications            :text(65535)
#  integration_methodology          :text(65535)
#  macp_certification_link          :string(255)
#  model                            :string(255)
#  mosip_compliance                 :string(255)
#  mosip_integration                :string(255)
#  name                             :string(255)
#  print_software_version           :string(255)
#  sbi_version                      :string(255)
#  short_description                :text(65535)
#  software_version                 :string(255)
#  supported_biometric_modalities   :string(255)
#  usage                            :text(65535)
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  category_id                      :bigint           not null
#  manufacturer_id                  :bigint           not null
#  mosip_compliance_status_id       :bigint
#  product_ftm_certification_id     :bigint
#  product_specification_version_id :bigint
#
# Indexes
#
#  index_products_on_category_id                       (category_id)
#  index_products_on_manufacturer_id                   (manufacturer_id)
#  index_products_on_mosip_compliance_status_id        (mosip_compliance_status_id)
#  index_products_on_product_ftm_certification_id      (product_ftm_certification_id)
#  index_products_on_product_specification_version_id  (product_specification_version_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (manufacturer_id => manufacturers.id)
#  fk_rails_...  (mosip_compliance_status_id => mosip_compliance_statuses.id)
#  fk_rails_...  (product_ftm_certification_id => product_ftm_certifications.id)
#  fk_rails_...  (product_specification_version_id => product_specification_versions.id)
#
class Product < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :category
  belongs_to :mosip_compliance_status, optional: true
  belongs_to :product_ftm_certification, optional: true
  belongs_to :product_specification_version, optional: true

  has_and_belongs_to_many :biometrics
  require 'roo'

  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images, allow_destroy: true

  before_save :check_certified

  state_machine :mosip_compliance do
    state :compliance_in_progress, value: "Compliance in Progress"
    state :compliant, value: "Compliant"
  
    event :compliant do
      transition [:compliance_in_progress] => :compliant
    end
  end
  
  state_machine :mosip_integration do
    state :integration_in_progress, value: "Integration in Progress"
    state :integrated, value: "Integrated"
  
    event :integrated do
      transition [:integration_in_progress] => :integrated
    end
  end
  
  def check_certified
    if self.certified_changed? && self.certified == true 
      if self.mosip_compliance != "Compliant"
        return false
      else
        return true
      end
    end
  end

  def self.filtered_product params, products
    if products.present?
      all_products = products
    else
      all_products = Product.all
    end
    filtered_pdts = []
    if params[:device_category].present?
      all_products = Product.all
      category_names = params[:device_category].uniq

      if filtered_pdts.present?
        filtered_pdts = filtered_pdts.joins(:category).where(categories: { name: category_names })
      else
        filtered_pdts = all_products.joins(:category).where(categories: { name: category_names })
      end
    end

    if params[:biometrics].present?

      biometrics_names = params[:biometrics].uniq
      if filtered_pdts.present?
        filtered_pdts = filtered_pdts.joins(:biometrics).where(biometrics: { name: biometrics_names }).distinct
      else
        filtered_pdts = all_products.joins(:biometrics).where(biometrics: { name: biometrics_names }).distinct
      end
    end

    if params[:mosip_compliance_status].present?
      mosip_compliance_status_names = params[:mosip_compliance_status].uniq
      if filtered_pdts.present?
        filtered_pdts = filtered_pdts.where(mosip_compliance: mosip_compliance_status_names)
                                      .or(filtered_pdts.where(mosip_integration: mosip_compliance_status_names))
      else
        filtered_pdts = all_products.where(mosip_compliance: mosip_compliance_status_names)
                                    .or(all_products.where(mosip_integration: mosip_compliance_status_names))
      end
    end
    

    if params[:macp_certified].present?
      if filtered_pdts.present?
        filtered_pdts = filtered_pdts.where.not(macp_certification_link: [nil, ''])
      else
        filtered_pdts = all_products.where.not(macp_certification_link: [nil, ''])
      end
    end

    if params[:manufacturers].present?
      manufacturer_ids = params[:manufacturers].uniq
      if filtered_pdts.present?
        filtered_pdts = filtered_pdts.where(manufacturer_id: manufacturer_ids)
      else
        filtered_pdts = all_products.where(manufacturer_id: manufacturer_ids)
      end
    end
    
    
    return filtered_pdts
  end

  def self.import_from_excel
    file_path = 'downloads/pdt_demo.xlsx'
    spreadsheet = Roo::Spreadsheet.open(file_path)
    header = spreadsheet.row(1).map(&:strip) # Remove any leading/trailing spaces from headers
    uploader = ImageUploader.new(:store)

    (2..spreadsheet.last_row).each do |i|
      row_data = spreadsheet.row(i)
      row = Hash[header.zip(row_data).map { |h, v| [h.strip, v] }]

      manufacturer = Manufacturer.find_by(name: row['manufacturer'])
      category = Category.find_by(name: row['category'])
      ftm_certification = ProductFtmCertification.find_by(name: row['ftm_certification'])
      spec_version = ProductSpecificationVersion.find_by(name: row['product_specification_version'])

      begin
        product = Product.find_or_initialize_by(name: row['name'])
        product.short_description = row['short_description']
        product.manufacturer = manufacturer if manufacturer
        product.category = category if category
        product.model = row['model']
        
        product.additional_components = row['additional_components']
        product.macp_certification_link = row['macp_certification_link']
        product.sbi_version = row['sbi_version']
        product.global_certifications = row['global_certifications']
        product.ftm_chip_make_and_model = row['ftm_chip_make_and_model']
        product.firmware_version = row['firmware_version']
        product.software_version = row['software_version']
        product.full_specifications = row['full_specifications']
        product.usage = row['usage']
        product.print_software_version = row['print_software_version']
        product.integration_methodology = row['integration_methodology']
        product.mosip_compliance = row['mosip_compliance']
        product.mosip_integration = row['mosip_integration']
        product.certified = row['certified'].to_s.downcase
        product.additional_feature = row['additional_feature']
        product.product_ftm_certification = ftm_certification if ftm_certification
        product.product_specification_version = spec_version if spec_version

        product.save!

        if row['image'].present?
          row['image'].split(',').each_with_index do |i,index|
            file = File.open("public/images/product/"+i)
            if file.present?
                uploaded_file = uploader.upload(file)
                p = product.product_images.create!(
                        image_data: uploaded_file.to_json,
                        position:index+1
                    )
                p.image_derivatives! 
                p.save! 
            end
          end
        end

        if row['supported_biometric_modalities'].present?
          row['supported_biometric_modalities'].split(',').each do |bio|
            product.biometrics << Biometric.find_by(name: bio)
            product.save!
          end
        end

        
      rescue => e
        Rails.logger.error "Row #{i}: #{e.message}"
      end
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[name category_name]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[category]
  end

  def self.fetch_all_product query=nil
      if query.present?
          return Product.where("name LIKE ?", "#{query}%")
      else
          return Product.all
      end
  end
  
  
end
