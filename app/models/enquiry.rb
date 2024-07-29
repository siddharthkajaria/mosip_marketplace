# == Schema Information
#
# Table name: enquiries
#
#  id           :bigint           not null, primary key
#  email        :string(255)
#  enquiry_type :string(255)
#  name         :string(255)
#  phone_number :string(255)
#  question     :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Enquiry < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates :phone_number, presence: true
    validates :enquiry_type, presence: true

    after_create :send_mail

    def send_mail
        EnquiryMailer.enquiry_form(self.name, self.phone_number, self.email, self.question, self.enquiry_type).deliver_now
    end
end
