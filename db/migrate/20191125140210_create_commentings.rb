class CreateCommentings < ActiveRecord::Migration[5.2]
  def change
    create_table :commentings do |t|
      t.references :post, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
