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
