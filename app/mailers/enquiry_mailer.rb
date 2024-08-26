class EnquiryMailer < ApplicationMailer
    def enquiry_form(name, email, organisation, designation, subject, question, type)
		@name = name
		@email = email 
		@type = type
		@question = question
		@organisation = organisation
		@designation = designation
		@subject = subject
				
		mail(to: "giridhar@tailwebs.com" , subject: 'New Enquiry'  ,from: "giridhar@tailwebs.com")
	end
end
