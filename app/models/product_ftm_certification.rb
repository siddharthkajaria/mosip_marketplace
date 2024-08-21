# == Schema Information
#
# Table name: product_ftm_certifications
#
#  id         :bigint           not null, primary key
#  code       :string(255)
#  desc       :text(65535)
#  name       :string(255)
#  status     :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ProductFtmCertification < ApplicationRecord
    has_many :products

    def self.fetch_all_certification query=nil
        if query.present?
            return ProductFtmCertification.where("name LIKE ?", "#{query}%")
        else
            return ProductFtmCertification.all
        end
    end
end
