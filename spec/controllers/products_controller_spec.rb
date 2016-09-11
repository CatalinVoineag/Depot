require 'rails_helper'

describe ProductsController do
	
	describe "GET index" do 
		it 'renders :index template' do 
			product = FactoryGirl.create(:product) 
			get :index
			expect(response).to render_template(:index)
			expect(assigns(:products)).to match_array([product])	
		end
	end

	describe "GET edit" do 
		let(:product) { FactoryGirl.create(:product) }

		it "renders :edit tempalte" do 
			get :edit, id: product
			expect(response).to render_template(:edit)
		end

		it 'assigns the requested product to tempalte' do 
			get :edit, id: product
			expect(assigns(:product)).to eq(product)
		end
	end

	describe "Put Update" do
		let(:product) { FactoryGirl.create(:product) } 
		context "valid data" do
			let(:valid_data) { FactoryGirl.attributes_for(:product, name: 'New Name') }

			it 'redirects to index' do
				put :update, id: product, product: valid_data
				expect(response).to redirect_to products_path
			end

			it 'updates product in the database' do 
				put :update, id: product, product: valid_data
				product.reload
				expect(product.name).to eq("New Name")
			end
		end

		context "invalid data" do
			let(:invalid_data) { FactoryGirl.attributes_for(:product, name: '', description: 'new description') }

			it 'reders edit tempalte' do 
				put :update, id: product, product: invalid_data
				expect(response).to render_template(:edit)
			end

			it "doesn't update product in the database" do 
				put :update, id: product, product: invalid_data
				product.reload
				expect(product.description).not_to eq('new description') 
			end
		end
	end

	describe "GET new" do
		
		it 'renders :new template' do 
			get :new
			expect(response).to render_template(:new)
		end

		it 'assigns new Product to @product' do
			get :new
			expect(assigns(:product)).to be_a_new(Product) 
		end
	end

	describe "GET index" do 
		let(:product) { FactoryGirl.create(:product) }

		it "renders :show template" do 
			get :show, id: product
			expect(response).to redirect_to(products_path)
		end

		it "assigns requested product to @product" do 
			get :show, id: product
			expect(assigns(:product)).to eq(product)
		end
	end

	describe "POST create" do 
		context 'valid data' do 
			let(:valid_data) { FactoryGirl.attributes_for(:product) }

			it "redirect to index" do
				post :create, product: valid_data
				expect(response).to redirect_to products_path
			end

			it 'creates new product in the database' do 
				expect {
					post :create, product: valid_data
					}.to change(Product, :count).by(1)
			end
		end

		context 'invalid data' do 
			let!(:invalid_data) { FactoryGirl.attributes_for(:product, name: '') }

			it 'redirect to new' do 
				post :create, product: invalid_data
				expect(response).to render_template :new
			end

			it "doesn't create new product in the database" do
				expect {
					post :create, product: invalid_data 
				}.not_to change(Product, :count)
			end
		end
	end

	describe "Delete destroy" do 
		let(:product) { FactoryGirl.create(:product) }

		it 'redirects to index' do 
			delete :destroy, id: product
			expect(response).to render_template :index
		end

		it "deletes product from database" do 
			delete :destroy, id: product
			expect(Product.exists?(product.id)).to be_falsy
		end
	end

end