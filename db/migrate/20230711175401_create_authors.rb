class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.text :user
      t.integer :post_number

      t.timestamps
    end
  end
end
