# == Schema Information
#
# Table name: product_images
#
#  id         :bigint           not null, primary key
#  image_data :text(65535)
#  position   :integer
#  status     :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#
# Indexes
#
#  index_product_images_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
class ProductImage < ApplicationRecord
  belongs_to :product
  include ImageUploader::Attachment(:image)
  scope :active, -> { where(status: true) }

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
