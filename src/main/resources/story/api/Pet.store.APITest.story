Description: API Tests Demo

Scenario: 1. Verify that Currency Exchange Service is alive

When I execute HTTP GET request for resource with URL `${main-app-url}`
Then `${responseCode}` is equal to `200`



Scenario: 2. Verify User can be created via API

Given request body: {
  "id": 10,
  "username": "testuser",
  "firstName": "test",
  "lastName": "user",
  "email": "testuser@yopmail.com",
  "password": "qwerty123",
  "phone": "987654",
  "userStatus": 1
}
When I set request headers:
|name|value|
|accept|application/json|
|Content-Type|application/json|
When I execute HTTP POST request for resource with URL `https://petstore.swagger.io/v2/user`
Then `${responseCode}` is equal to `200`
Then JSON element from `${response}` by JSON path `$.message` is equal to `"10"`


Scenario: 3. Verify User can be logged in via API

When I execute HTTP GET request for resource with URL `https://petstore.swagger.io/v2/user/login?username=testuser&password=qwerty123`
Then `${responseCode}` is equal to `200`


Scenario: 4. Verify list of User can be created via API

Given request body: [
{
    "id": 1,
    "username": "string",
    "firstName": "string",
    "lastName": "string",
    "email": "string",
    "password": "string",
    "phone": "string",
    "userStatus": 0,
     "id": 2,
    "username": "string",
    "firstName": "string",
    "lastName": "string",
    "email": "string",
    "password": "string",
    "phone": "string",
    "userStatus": 1
  }
]
When I set request headers:
|name|value|
|accept|application/json|
|Content-Type|application/json|
When I execute HTTP POST request for resource with URL `https://petstore.swagger.io/v2/user/createWithArray`
Then `${responseCode}` is equal to `200`
Then JSON element from `${response}` by JSON path `$.message` is equal to `"ok"`


Scenario: 5 Verify User can be logged out via API

When I execute HTTP GET request for resource with URL `https://petstore.swagger.io/v2/user/logout`
Then `${responseCode}` is equal to `200`
Then JSON element from `${response}` by JSON path `$.message` is equal to `"ok"`


Scenario: 6 Verify that Pet can be added via API

Given request body: {
  "id": 2,
  "category": {
    "id": 3,
    "name": "Cats"
  },
  "name": "CAT",
  "photoUrls": [
    "/photo/cat"
  ],
  "tags": [
    {
      "id": 2,
      "name": "hungry"
    }
  ],
  "status": "available"
}
When I set request headers:
|name|value|
|accept|application/json|
|Content-Type|application/json|
When I execute HTTP POST request for resource with URL `https://petstore.swagger.io/v2/pet`
Then `${responseCode}` is equal to `200`
Given I initialize scenario variable `json` with value `${response}`
Then JSON element from `${response}` by JSON path `$.category` is equal to `{
    "id": 3,
    "name": "Cats"
  }`


Scenario: 7 Verify that Pet photo can be added via API

Given I initialize scenario variable `img` with value `#{loadResource(/data/Eclipse IDE.png)}`
Given form data request:
|name     |value  |
|additionalMetadata|alternative   |
Given multipart request:
|type  |name   |value            |contentType|fileName       |
|file  |Image  |/data/Eclipse IDE.png   | image/png          ||
When I set request headers:
|name|value|
|accept|application/json|
|Content-Type|multipart/form-data|
When I execute HTTP POST request for resource with URL `https://petstore.swagger.io/v2/pet/2/uploadImage`
Then `${responseCode}` is equal to `200`
Then JSON element from `${response}` by JSON path `$.message` is equal to `"additionalMetadata: alternative\nFile uploaded to ./Images_import_export_docker.png, 81060 bytes"`


Scenario: 8 Verify that Pets name and status can be updated via API

Given request body: {
  "id": 2,
  "category": {
    "id": 3,
    "name": "Cats"
  },
  "name": "CAT",
  "photoUrls": [
    "/photo/cat"
  ],
  "tags": [
    {
      "id": 2,
      "name": "hungry"
    }
  ],
  "status": "unavailable"
}
When I set request headers:
|name|value|
|accept|application/json|
|Content-Type|application/json|
When I execute HTTP PUT request for resource with URL `https://petstore.swagger.io/v2/pet`
Then `${responseCode}` is equal to `200`
Then JSON element from `${response}` by JSON path `$.status` is equal to `"unavailable"`


Scenario: 9 Verify that Pet can be deleted via API

When I set request headers:
|name|value|
|accept|application/json|
When I execute HTTP DELETE request for resource with URL `https://petstore.swagger.io/v2/pet/2`
Then `${responseCode}` is equal to `200`
Then JSON element from `${response}` by JSON path `$.message` is equal to `"2"`
