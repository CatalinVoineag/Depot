class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.decimal :total_price
      t.string :status
      t.string :email
      t.string :bill_address
      t.string :ship_address

      t.timestamps null: false
    end
  end
end
