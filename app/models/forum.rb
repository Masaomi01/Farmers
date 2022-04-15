class Forum < ApplicationRecord
    
    belongs_to :user
    
    def display_created_at
        I18n.l(created_at, format: :default)
    end
end
