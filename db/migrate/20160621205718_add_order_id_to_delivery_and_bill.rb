class AddOrderIdToDeliveryAndBill < ActiveRecord::Migration
  def change
  	add_column :delivery_addresses, :order_id, :integer
  	add_column :bill_addresses, :order_id, :integer
  end
end
