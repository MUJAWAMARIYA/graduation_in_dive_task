json.extract! post, :id, :user_name, :country, :province, :district, :sector, :cell, :village, :contact, :gender, :ID_number, :date, :post_reason, :confirmation, :created_at, :updated_at
json.url post_url(post, format: :json)
