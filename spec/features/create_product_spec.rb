require 'rails_helper'

feature 'login and create product' do
	before do 
		FactoryGirl.create(:user)
		FactoryGirl.create(:product)
	end
	scenario "login as admin" do 

		visit('/')
		click_link("Log in")
		expect(page).to have_content('Email')
	
		fill_in "Email", with: 'catalin@example.com'
		fill_in "Password", with: 'foobar'
		email = find_field("Email").value
		password = find_field('Password').value
		expect(email).to eq('catalin@example.com')
		expect(password).to eq('foobar')
		
		click_on 'Sign in'

		expect(page).to have_selector 'h1', text: 'Products'
		expect(page).to have_link  'New Product'

		click_link('New Product')
		expect(page).to have_content('New Product')

		fill_in('Name', with: 'orange')
		fill_in('Description', with: 'very orange')
		fill_in('Price', with: '0.30')
		click_on('Create Product')

		expect(page).to have_content("Product Created")


	end
	
end 

