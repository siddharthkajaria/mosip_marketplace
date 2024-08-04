# == Schema Information
#
# Table name: products
#
#  id                             :bigint           not null, primary key
#  additional_components          :text(65535)
#  additional_feature             :text(65535)
#  firmware_version               :string(255)
#  ftm_certification              :string(255)
#  ftm_chip_make_and_model        :string(255)
#  full_specifications            :text(65535)
#  global_certifications          :text(65535)
#  integration_methodology        :text(65535)
#  macp_certification_link        :string(255)
#  model                          :string(255)
#  name                           :string(255)
#  print_software_version         :string(255)
#  sbi_version                    :string(255)
#  short_description              :text(65535)
#  software_version               :string(255)
#  supported_biometric_modalities :string(255)
#  usage                          :text(65535)
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  category_id                    :bigint           not null
#  manufacturer_id                :bigint           not null
#  mosip_compliance_status_id     :bigint
#
# Indexes
#
#  index_products_on_category_id                 (category_id)
#  index_products_on_manufacturer_id             (manufacturer_id)
#  index_products_on_mosip_compliance_status_id  (mosip_compliance_status_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (manufacturer_id => manufacturers.id)
#  fk_rails_...  (mosip_compliance_status_id => mosip_compliance_statuses.id)
#
class Product < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :category
  belongs_to :mosip_compliance_status
  has_and_belongs_to_many :biometrics


  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images, allow_destroy: true


  def self.filtered_product params

    all_products = Product.all
    filtered_pdts = []
    if params[:device_category].present?
      category_names = params[:device_category]

      if filtered_pdts.present?
        filtered_pdts = filtered_pdts.joins(:category).where(categories: { name: category_names })
      else
        filtered_pdts = all_products.joins(:category).where(categories: { name: category_names })
      end
    end

    if params[:biometrics].present?

      biometrics_names = params[:biometrics]
      if filtered_pdts.present?
        filtered_pdts = filtered_pdts.joins(:biometrics).where(biometrics: { name: biometrics_names }).distinct
      else
        filtered_pdts = all_products.joins(:biometrics).where(biometrics: { name: biometrics_names }).distinct
      end
    end
    
    if params[:product_name].present?
      pdt_name = params[:product_name]

      if filtered_pdts.present?
        filtered_pdts = filtered_pdts.where(name:pdt_name)
      else
        filtered_pdts = all_products.where(name:pdt_name)
      end
    end
    return filtered_pdts
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[name category_name]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[category]
  end

  
  
end
