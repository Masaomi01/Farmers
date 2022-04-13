class Forum < ApplicationRecord
    def display_created_at
        I18n.l(created_at, format: :default)
    end
end
