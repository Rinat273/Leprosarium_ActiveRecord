class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.belongs_to :post
      t.belongs_to :author
      t.date :created_date
      t.text :content
      t.integer :post_number
      
      t.timestamps
    end
  end
end
