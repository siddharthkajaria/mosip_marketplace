# == Schema Information
#
# Table name: system_integrators
#
#  id                   :bigint           not null, primary key
#  desc                 :text(65535)
#  image_data           :text(65535)
#  name                 :string(255)
#  partnership_validity :date
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  si_partnership_id    :bigint           not null
#
# Indexes
#
#  index_system_integrators_on_si_partnership_id  (si_partnership_id)
#
# Foreign Keys
#
#  fk_rails_...  (si_partnership_id => si_partnerships.id)
#
class SystemIntegrator < ApplicationRecord
  belongs_to :si_partnership
end
