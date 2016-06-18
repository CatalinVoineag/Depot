class CreateDeliveryAddresses < ActiveRecord::Migration
  def change
    create_table :delivery_addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :street_address_1
      t.string :street_address_2
      t.string :city
      t.string :country
      t.string :postcode
      t.integer :phone
      t.boolean :active
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
