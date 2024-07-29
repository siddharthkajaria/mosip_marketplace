# == Schema Information
#
# Table name: partners
#
#  id         :bigint           not null, primary key
#  desc       :text(65535)
#  image_data :text(65535)
#  name       :string(255)
#  position   :integer
#  url        :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Partner < ApplicationRecord
end
