# == Schema Information
#
# Table name: manufacturers
#
#  id           :bigint           not null, primary key
#  address      :text(65535)
#  desc         :text(65535)
#  email_one    :string(255)
#  email_three  :string(255)
#  email_two    :string(255)
#  image_data   :text(65535)
#  name         :string(255)
#  phone_one    :string(255)
#  phone_three  :string(255)
#  phone_two    :string(255)
#  website_link :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Manufacturer < ApplicationRecord
end
