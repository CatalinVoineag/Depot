class ChangeExpirationDateToDatetime < ActiveRecord::Migration
  def change
  	remove_column :payments, :expiration_date
  	remove_column :orders, :step

  	add_column :payments, :expiration_date, :datetime
  end
end
