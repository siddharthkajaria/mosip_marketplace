# == Schema Information
#
# Table name: product_specification_versions
#
#  id         :bigint           not null, primary key
#  code       :string(255)
#  desc       :text(65535)
#  name       :string(255)
#  status     :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ProductSpecificationVersion < ApplicationRecord
    has_many :products
end
