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
#  partner_category_id :bigint           not null
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
    belongs_to :partner_category
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
end
