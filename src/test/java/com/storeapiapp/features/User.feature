Feature: StoreApp >> User API's >> Single User

Background:
#Calling login feature file and getting value of access token
    * def loginFeatureFile = call read('../features/Login.feature')
    * def getAccessTokenFromLogin = loginFeatureFile.response.data.access_token
    * print 'Access token value from login is: ', getAccessTokenFromLogin

#To validate response of Scenario 'To verify nodes for single user' created file 'validateResponseSingleUser'
    * def expectedResponseSingleUser = read('../jsonResponse/validateResponseSingleUser.json')
    And print expectedResponseSingleUser
     

#<--- Scenario START --->
@user
Scenario: To verify list of users
    Given url 'https://api.storerestapi.com/users'
    And header AccessToken = getAccessTokenFromLogin
    And headers {Content-Type: 'application/json',Accept: '*/*',Connection: 'keep-alive'}
    When method Get
    Then status 200
    Then print response

@user @singleUser
Scenario: To verify nodes for single user
    Given url 'https://api.storerestapi.com/users/612e4851345dcc333ac6cb24'
    And header AccessToken = getAccessTokenFromLogin
    When method Get
    Then status 200
    Then print response

    And match response.data._id == "612e4851345dcc333ac6cb24"
    And match response.data.email != null
    And match response == expectedResponseSingleUser

#<--- Scenario END --->