module ApplicationHelper

    def present?(value)
        value.present? && value != "NULL"
    end


end
