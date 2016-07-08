Feature: Add Cart Item

	In order to process an order
	Add lines to a Cart
	Process Order

	Scenario: Add cart item and process order
		Given User Login
		And add cart item
		When Go to cart Index
		Then Process order

		