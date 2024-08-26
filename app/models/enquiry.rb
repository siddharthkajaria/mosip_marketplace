# == Schema Information
#
# Table name: enquiries
#
#  id           :bigint           not null, primary key
#  designation  :string(255)
#  email        :string(255)
#  enquiry_type :string(255)
#  name         :string(255)
#  organisation :string(255)
#  question     :text(65535)
#  subject      :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Enquiry < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates :organisation, presence: true
    validates :enquiry_type, presence: true
    validates :subject, presence: true
    validates :question, presence: true

    after_create :send_mail

    def send_mail
        EnquiryMailer.enquiry_form(self.name, self.email, self.organisation, self.designation, self.subject, self.question, self.enquiry_type).deliver_now
    end
end
