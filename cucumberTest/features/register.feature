Feature: Registation

	Scenario: Register a new user at zalora website
		Given I go to zalora home page
		Then I register a new user
		Then I fill the registration form fills
		Then I click create account
		Then I add my shipping address
		Then I browse the men clothing catalogue
		Then I add the second item to the wishlist
