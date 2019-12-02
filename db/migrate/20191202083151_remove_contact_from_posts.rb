class RemoveContactFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :contact, :string
  end
end
