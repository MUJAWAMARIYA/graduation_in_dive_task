class AddFoundIdDateToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :found_id_date, :date
  end
end
