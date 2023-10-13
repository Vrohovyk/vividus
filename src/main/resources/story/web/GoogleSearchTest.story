Description: The Demo Tests for WEB App Plugin


Scenario: 1. Verify VIVIDUS documentation is in Top 10 Google search results

Given I am on main application page
Then the page title is 'What is VIVIDUS :: VIVIDUS'
Then number of elements found by `By.xpath(//h1[contains (text(),"What is VIVIDUS")])` is = `1`


Scenario: 2. Verify that "Getting Started" page is loading

Given I am on main application page
When I click on element located by `By.xpath(//a[@class='nav-link' and @href='getting-started.html'])`
Then number of elements found by `By.xpath(//h1[contains (text(),'Getting Started')])` is = `1`
