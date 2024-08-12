# == Schema Information
#
# Table name: products
#
#  id                             :bigint           not null, primary key
#  additional_components          :text(65535)
#  additional_feature             :text(65535)
#  certified                      :boolean          default(FALSE)
#  firmware_version               :string(255)
#  ftm_certification              :string(255)
#  ftm_chip_make_and_model        :string(255)
#  full_specifications            :text(65535)
#  global_certifications          :text(65535)
#  integration_methodology        :text(65535)
#  macp_certification_link        :string(255)
#  model                          :string(255)
#  mosip_compliance               :string(255)
#  mosip_integration              :string(255)
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
        filtered_pdts = filtered_pdts.joins(:mosip_compliance_status).where(mosip_compliance_statuses: { name: mosip_compliance_status_names })
      else
        filtered_pdts = all_products.joins(:mosip_compliance_status).where(mosip_compliance_statuses: { name: mosip_compliance_status_names })
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

  def self.ransackable_attributes(auth_object = nil)
    %w[name category_name]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[category]
  end

  
  
end
