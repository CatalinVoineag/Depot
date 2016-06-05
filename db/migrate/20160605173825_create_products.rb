class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.datetime :available_on
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
