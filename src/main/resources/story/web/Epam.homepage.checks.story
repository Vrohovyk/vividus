Description: The Scenarios for Epam webpage


Scenario: 1. Verify Epam home page has correct title

Given I am on main application page
Then the page title is 'EPAM | Software Engineering & Product Development Services'


Scenario: 2. Epam page theme can be chaged to different one

Given I am on main application page
When I click on element located by `By.xpath(//div[@class='theme-switcher'])`
Then number of elements found by `By.xpath(//body[@class='fonts-loaded light-mode'])` is = `1`


Scenario: 3. Verify that after language swithc correct content is displayed

Given I am on main application page
When I click on element located by `By.xpath(//button[@class='location-selector__button'])`
When I click on element located by `By.xpath(//a[@lang='uk' and @href='https://careers.epam.ua'])`
Then the page title is 'EPAM Ukraine - найбільша ІТ-компанія в Україні | Вакансії'


Scenario: 4. Verify Policies list has all elements

//Given I initialize scenario variable `policy_expected` with value `6`
Given I am on main application page
When I scroll element located by `By.xpath(//ul[@class='ul policies-left'])` into view
When I save text of element located by `By.xpath(//ul[@class='ul policies-left'])` to story variable `policies-left`
Then `${policies-left}` matches `INVESTORS OPEN SOURCE PRIVACY POLICY`
When I save text of element located by `By.xpath(//ul[@class='ul policies-right'])` to story variable `policies-right`
Then `${policies-right}` matches `COOKIE POLICY APPLICANT PRIVACY NOTICE WEB ACCESSIBILITY`


Scenario: 5. Verify Region switch is present and allows change of region

Given I am on main application page
When I scroll element located by `By.xpath(//ul[@class='ul policies-left'])` into view
When I save text of element located by `By.xpath(//div[@class='tabs-23__ul js-tabs-links-list'])` to story variable `regions`
Then `${regions}` matches `AMERICAS EMEA APAC`
When I click on element located by `By.xpath(//a[@data-item="2"])`
Then number of elements found by `By.xpath(//button[@class='locations-viewer-23__country-btn' and @aria-label='Card 2 of 8 China'])` is = `2`

Scenario: 6. Verify Search is displaying correct results

Given I am on main application page
When I click on element located by `By.xpath(//button[@class='header-search__button header__icon'])`
When I add `AI` to field located by `By.xpath(//input[@id='new_form_search'])`
When I click on element located by `By.xpath(//button[@class='custom-button button-text font-900 gradient-border-button large-gradient-button uppercase-text custom-search-button'])`
Then the page with the URL 'https://www.epam.com/search?q=AI' is loaded


Scenario: 7. Verify required fields on contact form

Given I am on page with URL `https://www.epam.com/about/who-we-are/contact`
When I click on element located by `By.xpath(//button[@type='submit'])`
Then number of elements found by `By.xpath(//div[@data-required='true'])` is = `8`


Scenario: 8. Verify that company logo navigates to homepage

Given I am on page with URL `https://www.epam.com/about`
When I click on element located by `By.xpath(//a[@class="header__logo-container desktop-logo"])`
Then the page with the URL 'https://www.epam.com/' is loaded

Scenario: 9. Verify that company report is downloaded in correct format
