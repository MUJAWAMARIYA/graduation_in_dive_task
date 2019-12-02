class AddEmailToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :email, :string
  end
end
