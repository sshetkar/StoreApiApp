Feature: StoreApp >> User API's >> Add new user

Background:
#Declarations and file read
    * def createUserReqBody = read('../request/createUserRequest.json')
    And print createUserReqBody
    * url 'https://api.storerestapi.com/users'

#<--- Scenario START --->
@user @newUser
Scenario: To verify new user on storeapi site
    And request createUserReqBody
    #And header Content-Type = 'application/json'
    And headers {Content-Type: 'application/json',Accept: '*/*',Connection: 'keep-alive'}
    When method Post
    Then status 201
    Then print 'Response is ',response
    * def setAccessTokenforNewUser = response.access_token
    * def setRefreshTokenforNewUser = response.refresh_token

#<--- Scenario END --->