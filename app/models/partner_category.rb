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
end
