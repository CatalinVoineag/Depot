class BillAddressPolicy < ApplicationPolicy

	def new
		User.edit_correct_user_data(@user, 'BillAddress')
	end

	def edit?
		User.edit_correct_user_data(@user, 'BillAddress')
	end

	def destroy?
		User.edit_correct_user_data(@user, 'BillAddress')
	end

	def show?
		User.edit_correct_user_data(@user, 'BillAddress')
	end

	def create?
		User.edit_correct_user_data(@user, 'BillAddress')
	end

	def new?
		User.edit_correct_user_data(@user, 'BillAddress')
	end

	def destroy?
		User.edit_correct_user_data(@user, 'BillAddress')
	end

end