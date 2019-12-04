class AddNamesToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :names, :string
  end
end
