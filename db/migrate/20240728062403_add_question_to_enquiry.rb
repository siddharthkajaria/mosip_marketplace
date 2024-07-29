class AddQuestionToEnquiry < ActiveRecord::Migration[7.0]
  def change
    add_column :enquiries, :question, :text
  end
end
