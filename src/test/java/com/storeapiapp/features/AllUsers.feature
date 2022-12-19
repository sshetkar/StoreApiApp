Feature: StoreApp >> User API's >> All Users

Background:
    #Declarations and file read
    * def expectedResponseAllUsers = read('ValidateResponseAllUsers.json')
    And print expectedResponseAllUsers

#<--- Scenario START --->

Scenario: To verify nodes under all user details for 1st user
    Given url 'https://api.storerestapi.com/users/612e4851345dcc333ac6cb24'
    When method Get
    Then status 200
    And match response == expectedResponseAllUsers.data[0]

Scenario: To verify nodes under all user details for last user
    Given url 'https://api.storerestapi.com/users/61e944df2cefb5a72936696a'
    When method Get
    Then status 200
    And match response == expectedResponseAllUsers.data[15]


#<--- Scenario END --->    