# Hello Codeception

## What is it for?

With this project I can easiely start to write acceptance (integration) tests.


### How use

1. Run requirements.sh at first time for installation Selenium, ChromeDrive.
2. Add new test with
    ``` bash
    ./vendor/bin/codecept generate:cest acceptance SaleAds
    ```
    
2. Run up.sh for running Selenium and tests.


### Helpers

1. **ProtectedUserRepo** - it allows you store account credentials (logins and passwords) in separated files, which excluded from git.
2. **Wildfowl** - some useful function for your test.