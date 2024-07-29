# == Schema Information
#
# Table name: biometrics
#
#  id         :bigint           not null, primary key
#  code       :string(255)
#  desc       :text(65535)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Biometric < ApplicationRecord
    has_and_belongs_to_many :products
end
