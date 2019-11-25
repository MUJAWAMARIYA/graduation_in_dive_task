class AddIdNoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :id_no, :string
  end
end
