Feature: Google
	
	Scenario: Opens google and search for item on chrome browser
		Given I can access google homepage on chrome browser
		Then I search for zalora
		Then I click on zalora homepage from search result
