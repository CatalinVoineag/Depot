class ChangeOrderModel < ActiveRecord::Migration
  def change
  	remove_column :orders, :ship_address
  	remove_column :orders, :bill_address

  	add_column :orders, :delivery_address_id, :integer
  	add_column :orders, :bill_address_id, :integer
  	add_column :orders, :order_number, :integer
  end
end
 