class AddTelephoneNumberToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :telephone_number , :string
  end
end
