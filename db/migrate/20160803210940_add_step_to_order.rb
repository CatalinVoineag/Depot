class AddStepToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :step, :string, default: 'address'
  end
end
