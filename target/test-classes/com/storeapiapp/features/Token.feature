Feature: StoreApp >> Auth API's >> Login

Background:
    #Declarations and file read
    * def loginReqBody = read('../request/loginRequest.json')
    And print loginReqBody
    * url 'https://api.storerestapi.com/auth/login'

Scenario: To generate token using login API
    And request loginReqBody
    When method Post
    Then status 200
    And match response.message contains 'Sign in success'

    * def setAccessTokenForLogin = response.data.access_token
    And print 'setAccessTokenForLogin is: ',setAccessTokenForLogin
    * def setRefreshTokenForLogin = response.data.refresh_token
    And print 'setRefreshTokenForLogin is: ',setRefreshTokenForLogin