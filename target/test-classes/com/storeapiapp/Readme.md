RUNNING test using 'StoreApiAppTest.java' runner file:

[1] To run scenario specified under - specific tag:
mvn test -Dtest=SampleTest#testTags
---> mvn test -Dtest=StoreApiAppTest#testTags

[2] To run all scenario under all feature files:
- mvn test
- mvn test "-Dkarate.options=--tags @user"
*NOTE:* Runner file 'StoreApiAppTest.java' should be under the same folder of feature file.

[3] To skip a scenario's under any feature file:
- add tag @ignore for the scenario
- mvn test "-Dkarate.options=--tags ~@skip"

[4] Calling login feature file and getting value of access token
    * def loginFeatureFile = call read('../features/Login.feature')
    * def getAccessTokenFromLogin = loginFeatureFile.response.data.access_token
    * print 'Access token value from login is: ', getAccessTokenFromLogin

[5] Calling login feature file and getting value of access token only once per user
* def loginFeatureFile = callonce read('../features/Login.feature')

[6] To setup the env
- mvn test "-Dkarate.options=--tags ~@skip" "-Dkarate.env=Dev"

[7] BeforeHook & AfterHook
Before hook - callonce
After hook - 

[8] For parallel execution
 - Add method testParallel() in runner file
 - Provide the number e.g.5 the no. of threads will be 5
 - It will randomly pick scenarios and will start with execution of the same
 - To avoid parallel execution on feature file use '@parallel=false'

[9] 