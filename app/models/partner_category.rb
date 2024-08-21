# == Schema Information
#
# Table name: partner_categories
#
#  id         :bigint           not null, primary key
#  desc       :text(65535)
#  image_data :text(65535)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PartnerCategory < ApplicationRecord
    has_many :partners

    include PartnerCategoryImageUploader::Attachment(:image)


    def self.fetch_all_category query=nil
        if query.present?
            return PartnerCategory.where("name LIKE ?", "#{query}%")
        else
            return PartnerCategory.all
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
end
