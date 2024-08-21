# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  code        :string(255)
#  description :text(65535)
#  image_data  :text(65535)
#  name        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Category < ApplicationRecord
    has_many :products

    def self.fetch_all_category query=nil
        if query.present?
            return Category.where("name LIKE ?", "#{query}%")
        else
            return Category.all
        end
    end
end
