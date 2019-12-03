class AddLostIdDateOrFoundIdDateToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :lost_id_date_or_found_id_date, :date
  end
end
