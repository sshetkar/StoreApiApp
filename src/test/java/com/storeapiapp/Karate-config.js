function fn() {   
  var env = karate.env; // get java system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev'; // a custom 'intelligent' default
  }

  var config = {
    prodBaseUrl: 'https://api.storerestapi.com',
    stageBaseUrl: 'https://api.stage.storerestapi.com'
    // appId: 'my.app.id',
    // appSecret: 'my.secret',
    // someUrlBase: 'https://some-host.com/v1/auth/',
    // anotherUrlBase: 'https://another-host.com/v1/'
  }

  if (env == 'dev') {
    // over-ride only those that need to be
    config.prod = 'https://api.storerestapi.com';
  } 
  if (env == 'e2e') {
    config.someUrlBase = 'https://e2e-host/v1/auth';
  }
  return config;
}