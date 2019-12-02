class RemoveYourOpinionFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :your_opinion, :string
  end
end
