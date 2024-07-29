# == Schema Information
#
# Table name: mosip_compliance_statuses
#
#  id         :bigint           not null, primary key
#  desc       :text(65535)
#  is_active  :boolean          default(TRUE)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MosipComplianceStatus < ApplicationRecord
end
