class DeliveryAddressPolicy < ApplicationPolicy

	def new
		User.edit_correct_user_data(@user, 'DeliveryAddress')
	end

	def edit?
		User.edit_correct_user_data(@user, 'DeliveryAddress')
	end

	def destroy?
		User.edit_correct_user_data(@user, 'DeliveryAddress')
	end

	def show?
		User.edit_correct_user_data(@user, 'DeliveryAddress')
	end

	def create?
		User.edit_correct_user_data(@user, 'DeliveryAddress')
	end

	def new?
		User.edit_correct_user_data(@user, 'DeliveryAddress')
	end

	def destroy?
		User.edit_correct_user_data(@user, 'DeliveryAddress')
	end


end