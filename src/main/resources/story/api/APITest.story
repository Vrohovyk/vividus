Description: API Tests Demo

Scenario: 1. Verify that Currency Exchange Service is alive

When I execute HTTP GET request for resource with URL `${main-app-url}`
Then `${responseCode}` is equal to `200`
