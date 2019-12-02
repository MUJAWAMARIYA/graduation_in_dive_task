class Post < ApplicationRecord
    belongs_to :user
    paginates_per 2
    has_many :commentings


    validates :user_name, :country, presence: true
    validates  :user_name, :country, :province, :district, :sector, :cell, :village, :telephone_number, :gender, :ID_number, :lost_id_date_or_found_id_date, :post_reason, :confirmation, :property_name, presence: true

    validates :ID_number, length: { is: 16 }, allow_blank: true
   
    validates :user_name, :country, :province, :district, :sector, :cell, :village, presence: true, format: { with: /\A[a-zA-Z'-]*\z/ }

    validates :telephone_number, :ID_number, format: { with: /\A\d+\z/, message: "allowed Numbers only " }
end
