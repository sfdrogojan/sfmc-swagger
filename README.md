# Automation Pipeline to generate API clients using Swagger Codegen

## Open API spec
The Open API spec describing the API routes can be found in `./openapi-2.0/sfmc-openapi-v2.json`

## Running the Automation Pipeline

Modify the Open API spec and then start the automation pipeline using the `run-automation-pipeline.sh` script.

```
cd scripts
./run-automation-pipeline.sh
```

## Supported languages
1. C#
2. Java

## Running the integration tests

The integration tests expect config values to exist in the environment variables

```
setx SFMC_ACCOUNT_ID "<<ACCOUNT_ID>>"
setx SFMC_AUTH_BASE_PATH "<<AUTH_TSE>>"
setx SFMC_CLIENT_ID "<<CLIENT_ID>>"
setx SFMC_CLIENT_SECRET "<<CLIENT_SECRET>>"
```
