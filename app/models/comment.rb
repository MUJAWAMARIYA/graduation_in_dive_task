class Comment < ApplicationRecord
    belongs_to :user
    validates :name, :email , :found_id_date, :feedback, presence: true
end
