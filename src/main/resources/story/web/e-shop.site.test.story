Description: The Scenarios for e-shop site


Scenario: 1. Verify that e-shop allows register a User

Given I initialize story variable `email` with value `#{generate(Internet.emailAddress)}`
Given I initialize story variable `password` with value `qwerty12`
Given I am on page with URL `https://demowebshop.tricentis.com/`
When I click on element located by `By.xpath(//a[@href='/register'])`
Then the page with the URL 'https://demowebshop.tricentis.com/register' is loaded
When I click on element located by `By.xpath(//input[@id='gender-male'])`
When I enter `Name` in field located by `By.xpath(//input[@id='FirstName'])`
When I enter `Surname` in field located by `By.xpath(//input[@id='LastName'])`
When I enter `${email}` in field located by `By.xpath(//input[@id='Email'])`
When I enter `${password}` in field located by `By.xpath(//input[@id='Password'])`
When I enter `${password}` in field located by `By.xpath(//input[@id='ConfirmPassword'])`
When I click on element located by `By.xpath(//input[@id='register-button'])`
Then the page with the URL 'https://demowebshop.tricentis.com/registerresult/1' is loaded
When I close browser


Scenario: 2. Verify that e-shop allows login a User

Given I am on page with URL `https://demowebshop.tricentis.com/`
When I click on element located by `By.xpath(//a[@href='/login'])`
Then the page with the URL 'https://demowebshop.tricentis.com/login' is loaded
When I enter `${email}` in field located by `By.xpath(//input[@id='Email'])`
When I enter `${password}` in field located by `By.xpath(//input[@id='Password'])`
When I click on element located by `By.xpath(//input[@value='Log in'])`
Then number of elements found by `By.xpath(//a[text()='${email}'])` is = `1`


Scenario: 3. Verify that e-shop Computer category has 3 sub-categories with valid names

Given I am on page with URL `https://demowebshop.tricentis.com/`
When I click on element located by `By.xpath(//ul[@class='top-menu']/li/a[@href='/computers' and text()='Computers'])`
Then number of elements found by `By.xpath(//div[@class='item-box'])` is = `3`
When I save text of element located by `By.xpath(//a[@href='/desktops' and @title='Show products in category Desktops' and text()='Desktops'])` to story variable `Desktop`
Then `${Desktop}` matches `Desktops`
When I save text of element located by `By.xpath(//a[@href='/notebooks' and @title='Show products in category Notebooks' and text()='Notebooks'])` to story variable `Notebooks`
Then `${Notebooks}` matches `Notebooks`
When I save text of element located by `By.xpath(//a[@href='/accessories' and @title='Show products in category Accessories' and text()='Accessories'])` to story variable `Accessories`
Then `${Accessories}` matches `Accessories`


Scenario: 4. Verify that sorting can be applied to page

Given I am on page with URL `https://demowebshop.tricentis.com/desktops`
When I select `Price: Low to High` in dropdown located by `By.xpath(//select[@id='products-orderby'])`
Then the page with the URL 'https://demowebshop.tricentis.com/desktops?orderby=10' is loaded
Then number of elements found by `By.xpath(//option[@value='https://demowebshop.tricentis.com/desktops?orderby=10' and @selected='selected'])` is = `1`
When I select `Created on` in dropdown located by `By.xpath(//select[@id='products-orderby'])`
Then the page with the URL 'https://demowebshop.tricentis.com/desktops?orderby=15' is loaded
Then number of elements found by `By.xpath(//option[@value='https://demowebshop.tricentis.com/desktops?orderby=15' and @selected='selected'])` is = `1`


Scenario: 5. Verify that number of items displayed can be changed

Given I am on page with URL `https://demowebshop.tricentis.com/desktops`
When I select `4` in dropdown located by `By.xpath(//select[@id='products-pagesize'])`
Then number of elements found by `By.xpath(//div[@class='product-item'])` is = `4`


Scenario: 6. Verify that items can be added to wishlist

Given I am on page with URL `https://demowebshop.tricentis.com/blue-and-green-sneaker`
When I click on element located by `By.xpath(//input[@id='add-to-wishlist-button-28'])`
Then number of elements found by `By.xpath(//span[@class='wishlist-qty' and text()='(1)'])` is = `1`
When I click on element located by `By.xpath(//div[@class='header-links']/ul/li/a[@href='/wishlist'])`
Then number of elements found by `By.xpath(//tr[@class='cart-item-row'])` is = `1`

Scenario: 7. Verify that items can be added to cart

Given I am on page with URL `https://demowebshop.tricentis.com/black-white-diamond-heart`
When I click on element located by `By.xpath(//input[@id='add-to-cart-button-14'])`
Then number of elements found by `By.xpath(//span[@class='cart-qty' and text()='(1)'])` is = `1`
When I click on element located by `By.xpath(//div[@class='header-links']/ul/li/a[@href='/cart'])`
Then number of elements found by `By.xpath(//tr[@class='cart-item-row'])` is = `1`


Scenario: 8. Verify that items can be removed from cart

Given I am on page with URL `https://demowebshop.tricentis.com/black-white-diamond-heart`
When I click on element located by `By.xpath(//input[@id='add-to-cart-button-14'])`
When I click on element located by `By.xpath(//div[@class='header-links']/ul/li/a[@href='/cart'])`
When I check checkbox located by `By.xpath(//input[@type='checkbox' and @name='removefromcart'])`
When I click on element located by `By.xpath(//input[@name='updatecart'])`
Then number of elements found by `By.xpath(//tr[@class='cart-item-row'])` is = `0`


Scenario: 9. Verify that it is possible to checkout item form cart

Given I am on page with URL `https://demowebshop.tricentis.com/smartphone`
When I click on element located by `By.xpath(//input[@id='add-to-cart-button-43'])`
When I click on element located by `By.xpath(//div[@class='header-links']/ul/li/a[@href='/cart'])`
When I check checkbox located by `By.xpath(//input[@type='checkbox' and @name='termsofservice'])`
When I click on element located by `By.xpath(//button[@id='checkout'])`
When I select `Canada` in dropdown located by `By.xpath(//select[@id='BillingNewAddress_CountryId'])`
When I enter `testcity` in field located by `By.xpath(//input[@id='BillingNewAddress_City'])`
When I enter `test address` in field located by `By.xpath(//input[@id='BillingNewAddress_Address1'])`
When I enter `12345` in field located by `By.xpath(//input[@id='BillingNewAddress_ZipPostalCode'])`
When I enter `87654321` in field located by `By.xpath(//input[@id='BillingNewAddress_PhoneNumber'])`
When I click on element located by `By.xpath(//input[@class='button-1 new-address-next-step-button' and @onclick='Billing.save()'])`
When I click on element located by `By.xpath(//input[@class='button-1 new-address-next-step-button' and @onclick='Shipping.save()'])`
When I click on element located by `By.xpath(//input[@class='button-1 shipping-method-next-step-button' and @onclick='ShippingMethod.save()'])`
When I click on element located by `By.xpath(//input[@class='button-1 payment-method-next-step-button' and @onclick='PaymentMethod.save()'])`
When I click on element located by `By.xpath(//input[@class='button-1 payment-info-next-step-button' and @onclick='PaymentInfo.save()'])`
When I click on element located by `By.xpath(//input[@class='button-1 confirm-order-next-step-button' and @onclick='ConfirmOrder.save()'])`
Then `${current-page-url}` is equal to `https://demowebshop.tricentis.com/checkout/completed/`
