class Comment < ApplicationRecord
    belongs_to :forum
    validates :content, presence: true
    def play_created_at
        I18n.l(self.created_at, format: :short)
    end
end
