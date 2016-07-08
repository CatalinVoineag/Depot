Given(/^User Login$/) do
	FactoryGirl.create(:user)
	FactoryGirl.create(:product)
	visit('/')
	click_link "Log in"
	fill_in "Email", with: 'catalin@example.com'
	fill_in 'Password', with: 'foobar'
	click_button 'Sign in'
	expect(page).to have_content "lemon"
end

Given(/^add cart item$/) do
  click_button 'Add to cart'
  expect(page).to have_content 'Cart 1'
end

When(/^Go to cart Index$/) do
	click_link 'Cart 1'
  expect(page).to have_content "Shopping Cart"
  expect(page).to have_content "Total Price $1.00"
end

Then(/^Process order$/) do
  click_link 'Proceed to Checkout'
	expect(page).to have_content('New Order')  
end
