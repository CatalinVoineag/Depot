class Product < ActiveRecord::Base

	validates :name, presence: true, length: { minimum: 3 }
	validates :description, presence: true, length: { minimum: 10 }
	validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }

end
