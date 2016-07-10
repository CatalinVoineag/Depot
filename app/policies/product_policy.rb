class ProductPolicy < ApplicationPolicy

	def destroy?
		@user.admin? 
	end

	def index?
		@user
	end

	def update?
		@user.admin? 
	end

	def edit?
		@user.admin?
	end

	def new?
		@user.admin?
	end

	def create?
		@user.admin? 
	end

	def show?
		@user.admin? 
	end

end