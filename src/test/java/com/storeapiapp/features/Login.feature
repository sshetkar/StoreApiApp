Feature: StoreApp >> Auth API's >> Login

Background:
    #Declarations and file read
    * def loginReqBody = read('../request/loginRequest.json')
    And print loginReqBody
    * url 'https://api.storerestapi.com/auth/login'

Scenario: To verify login on storeappapi site by existing customer
    And request loginReqBody
    When method Post
    Then status 200
    And match response.message contains 'Sign in success'

    * def setAccessTokenForLogin = response.data.access_token
    And print 'setAccessTokenForLogin is: ',setAccessTokenForLogin
    * def setRefreshTokenForLogin = response.data.refresh_token
    And print 'setRefreshTokenForLogin is: ',setRefreshTokenForLogin

Scenario Outline: To verify login validations
    And request
    """
        {  
        "email": "<inputEmail>",
        "password": "<inputPass>"
        }
    """
    When method Post
    Then status <statusCode>
    And match response.message contains "<errorMessage>"
    
    Examples:
     | inputEmail               | inputPass       | errorMessage                            | statusCode|
     | robertgonzalez@gmail.com |                 | \"password\" is not allowed to be empty | 422 |
     |                          | simple_password | \"email\" is not allowed to be empty    | 422 |
     | robertgonzalez@gmail.com | simple          | Your password is wrong                  | 400 |


#<--- Scenario END --->