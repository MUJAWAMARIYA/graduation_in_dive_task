class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :user_name
      t.string :country
      t.string :province
      t.string :district
      t.string :sector
      t.string :cell
      t.string :village
      t.string :contact
      t.string :gender
      t.string :ID_number
      t.date :date
      t.string :post_reason
      t.boolean :confirmation

      t.timestamps
    end
  end
end
