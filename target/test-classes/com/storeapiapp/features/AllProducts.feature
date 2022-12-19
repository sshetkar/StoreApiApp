Feature: StoreApp >> User API's >> Product

Scenario:
 Given url 'https://api.storerestapi.com/products'
 When method GET
 Then status 200
