class RemoveYourOpnionFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :your_opnion, :string
  end
end
