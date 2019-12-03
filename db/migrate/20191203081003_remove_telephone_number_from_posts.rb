class RemoveTelephoneNumberFromPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :contact, :telephone_number
  end
end
