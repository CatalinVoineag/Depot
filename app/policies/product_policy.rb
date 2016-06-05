class ProductPolicy < ApplicationPolicy

	def destroy?
		@user.admin? || user.admin?
	end

	def index?
		@user
	end

	def update?
		@user.admin? || user.admin?
	end

	def edit?
		#byebug
		update?
	end

	def new?
		@user.admin? || user.admin?
	end

	def create?
		@user.admin? || user.admin?
	end

	def show?
		@user.admin? || user.admin?
	end

end