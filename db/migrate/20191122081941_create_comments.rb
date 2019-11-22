class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :feedback
      t.string :your_opnion

      t.timestamps
    end
  end
end
