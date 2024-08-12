# == Schema Information
#
# Table name: mosip_compliance_statuses
#
#  id         :bigint           not null, primary key
#  code       :string(255)
#  desc       :text(65535)
#  image_data :text(65535)
#  is_active  :boolean          default(TRUE)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MosipComplianceStatus < ApplicationRecord
    include ComplianceImageUploader::Attachment(:image)

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
end
