class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
   
      rename_column :posts, :comments,:posts, :date,:your_opinion, :contact,  :lost_id_date_or_found_id_date,  :telephone_number, :name,
  
  end
end
