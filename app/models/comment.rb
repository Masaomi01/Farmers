class Comment < ApplicationRecord
    
    belongs_to :forum
    belongs_to :user
    validates :content, presence: true
    has_one_attached :avatar
    def play_created_at
        I18n.l(self.created_at, format: :short)
    end
end
