module CurrentCart
	extend ActiveSupport::Concern

	private

		def set_cart
			@cart = Cart.find()
		end


end