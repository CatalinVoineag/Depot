class ProductsController < ApplicationController

	before_action :set_product, only: [:edit, :update, :destroy, :show]

	after_filter :verify_authorized

	def index
		@products = Product.all
		authorize @products
	end

	def new
		@product = Product.new
		authorize @product
	end

	def create
		@product = Product.new(product_params)
		authorize @product
		respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: "Product Created" }
        format.json { render :show, status: :created, location: @product }
      else
        flash.now[:error] = AlertsHelper.getErrorAlertMessages(@product)
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
	end

	def edit
		#byebug
		authorize @product
	end

	def update
		authorize @product
		if @product.update_attributes(product_params)
			flash[:notice] = "Product Updated"
			redirect_to products_path
		else
			flash.now[:error] = AlertsHelper.getErrorAlertMessages(@product)
			redirect_to :edit
		end
	end

	def show
		authorize @product
		redirect_to products_path
	end

	def destroy
		authorize @product
		@product.destroy
		flash[:notice] = "Product Deleted"
	end

	private

	# Before Filters

	def set_product
		@product = Product.find(params[:id])
	end

	def product_params
		params.require(:product).permit(:name, :description, :price)
	end

end
