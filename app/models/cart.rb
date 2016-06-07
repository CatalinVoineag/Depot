class Cart < ActiveRecord::Base

	has_many :cart_lines, dependent: :destroy

	belongs_to :user

end
