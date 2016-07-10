class SessionsController < ApplicationController

  before_filter :require_user, :except => [:create, :new, :destroy]
  
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			log_in user
      set_cart
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
			redirect_back_or products_path
  	else
  		flash.now[:danger] = 'Invalid email/password combination'
      render :new
  	end
  end

  def destroy
  	log_out
  	redirect_to root_path
  end

end
