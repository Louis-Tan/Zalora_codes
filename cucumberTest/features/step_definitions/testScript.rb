require 'cucumber'
require 'rubygems'
require 'selenium-webdriver'


browser = Selenium::WebDriver.for :chrome 

	#Given (/^I can access Zalora SG homepage on chrome browser$/)do 
		#browser.get 'http://www.zalora.sg'
	#end

	Given(/^I can access google homepage on chrome browser$/)do		
		browser.get("http://www.google.com")
	end

	Then(/^I search for zalora$/)do
		wait = Selenium::WebDriver::Wait.new(:timeout => 15)
		input = wait.until{
			element = browser.find_element(:id,"lst-ib")
			element if element.displayed?
		}
		input = browser.find_element(:id, "lst-ib")
		input.send_keys("zalora")
		button = browser.find_element(:class,"lsb")
		button.click
	end

	Then(/^I click on zalora homepage from search result$/)do
		sleep 10
		element = browser.find_element(:link_text,"Online Shopping Singapore. Shop Fashion | ZALORA SG")
		element.click
	end

	Given (/^I go to zalora home page$/)do
		browser.get 'https://www.zalora.sg'		
		wait = Selenium::WebDriver::Wait.new(:timeout => 15)
		element =browser.find_element(:xpath,"//*[@id='evergage-tooltip-ambiKWoo']/div[1]/a/div")
		element.click
	end
	
	Then(/^I go to the log in page$/)do
		sleep 2
		loginIcon = browser.find_element(:xpath,"//*[@id='page']/header/div[1]/div[1]/span[4]/ul/li[1]/i")
		browser.mouse.move_to loginIcon
		sleep 3
		browser.find_element(:xpath,"//*[@id='page']/header/div[1]/div[1]/span[4]/ul/li[1]/div/div[3]/ul/li[1]/a").click

	end

	Then (/^I log in using my credentials$/) do
		sleep 3
    	input = browser.find_element(:id, "LoginForm_email")
		input.send_keys("zal@ora.com")
		browser.find_element(:id, "LoginForm_password").send_keys("asdf")
		browser.find_element(:xpath, "//*[@id='form-account-login']/div[2]/fieldset/div[3]/div[2]/button").click
		
	end

	Then (/^I browse the men clothing catalogue$/)do
		sleep 5
		men = browser.find_element(:link_text,"MEN")
		men.location_once_scrolled_into_view
		sleep 3
		men.click
		wait = Selenium::WebDriver::Wait.new(:timeout => 10)
		sleep 3
		browser.find_element(:link_text,"CLOTHING").click
	end

	#Then(/^I check for a sale item$/)do
	#end 


	#Then(/^I add the item to the wishlist$/)do
	#end

	Then (/^I register a new user$/)do
		register = browser.find_element(:xpath,"//*[@id='page']/header/div[1]/div[1]/span[4]/ul/li[1]/i")
		browser.mouse.move_to register
		sleep 3
		browser.find_element(:link_text,"REGISTER").click
	end

	Then (/^I fill the registration form fills$/)do
		sleep 2
		time = Time.new
		timeString = "_#{time.year}-#{time.month}-#{time.day}_#{time.hour}-#{time.min}-#{time.sec}"
		domain = "@zalora.com"
		$email = "#{"qa+droid"}#{timeString}#{domain}"
		browser.find_element(:id,"RegistrationForm_email").send_keys($email)
		$password = "123456"
		browser.find_element(:id,"RegistrationForm_password").send_keys($password)
		browser.find_element(:id,"RegistrationForm_password2").send_keys($password)
		browser.find_element(:id,"RegistrationForm_first_name").send_keys("test")
		browser.find_element(:id,"RegistrationForm_last_name").send_keys("test")
		browser.find_element(:xpath,"//*[@id='RegistrationForm_gender_1']").click
		sleep 2
	end

	Then (/^I click create account$/)do
		browser.find_element(:xpath,"//*[@id='send']").click
	end	

	Then (/^I add my shipping address$/)do
		wait = Selenium::WebDriver::Wait.new(:timeout => 10)
		browser.find_element(:id,"AddressForm_first_name").send_keys("test")
		browser.find_element(:id,"AddressForm_last_name").send_keys("test")
		browser.find_element(:id,"AddressForm_cell_phone").send_keys("91234567")
		browser.find_element(:id,"AddressForm_phone").send_keys("61234567")
		browser.find_element(:id,"AddressForm_address1").send_keys("ADDRESSFORM_ADDRESS_1")
		browser.find_element(:id,"AddressForm_postcode").send_keys("550550")
		browser.find_element(:id,"send").click

	end






	