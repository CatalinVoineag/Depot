class CreateCartLines < ActiveRecord::Migration
  def change
    create_table :cart_lines do |t|
      t.integer :cart_id
      t.integer :product_id
      t.integer :user_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
