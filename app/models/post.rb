class Post < ApplicationRecord
    belongs_to :user
    paginates_per 2
    has_many :commentings

    validates  :user_name, :country, :province, :district, :sector, :cell, :village, :contact, :gender, :ID_number, :date, :post_reason, :confirmation, presence: true

    validates :ID_number, length: { is: 16 }, allow_blank: true
   
    validates :user_name, :country, :province, :district, :sector, :cell, :village, presence: true, format: { with: /\A[a-zA-Z'-]*\z/ }

    validates :contact, :ID_number, format: { with: /\A\d+\z/, message: "allowed Numbers only " }
end
