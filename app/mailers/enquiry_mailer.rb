class EnquiryMailer < ApplicationMailer
    def enquiry_form(name, phone, email, question, type)
		@name = name
		@phone = phone
		@email = email 
		@type = type
		@question = question
				
		mail(to: "giridhar@tailwebs.com" , subject: 'New Enquiry'  ,from: "giridhar@tailwebs.com")
	end
end
