class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
    	t.integer :amount
    	t.integer :card_no
    	t.integer :card_code
    	t.string :expiration_date
    	t.string :card_name
    	t.integer :user_id
    	t.integer :order_id
      t.timestamps null: false
    end
  end
end
