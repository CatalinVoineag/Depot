class ChangeCartLineColumn < ActiveRecord::Migration
  def change
  	change_column :cart_lines, :quantity, :integer, :default => 0
  end
end
