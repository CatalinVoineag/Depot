module OrdersHelper

	def form_value (field, model=nil)
		field_value = ""
		order = current_user.orders.where(step: 'payment').first
		if order && !model
			field_value = order[field]
		elsif order && model
			field_value = order.send(model)[field]
		else
			field_value
		end
	end

end
