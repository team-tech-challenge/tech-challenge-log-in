# tech-challenge-log-in

[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/Naereen/StrapDown.js/graphs/commit-activity)
[![MIT License](https://img.shields.io/badge/License-MIT-blue.svg)](https://lbesson.mit-license.org/)
[![Terraform](https://img.shields.io/badge/Terraform-v1.0.0+-623CE4?logo=terraform)](https://img.shields.io/badge/Terraform-v1.0.0+-623CE4?logo=terraform)
[![Terraform AWS Documentation](https://img.shields.io/badge/Terraform%20AWS-Documentation-623CE4?logo=terraform)](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
[![Terraform Documentation](https://img.shields.io/badge/Terraform-Documentation-623CE4?logo=terraform)](https://www.terraform.io/docs/index.html)
[![GitHub](https://img.shields.io/badge/GitHub-terraform--modules--registry-181717?logo=github)](https://github.com/team-tech-challenge/terraform-modules-remotes)

### This repository contains Terraform modules for AWS resources.

##  **Structure of the Repository**

The repository is structured as follows:


```
./
|   .gitignore
|   Dockerfile
|   README.md
|
+---.github
|   \---workflows
|           deploy-project.yaml
|
+---iac
|   |   backend.tf
|   |   locals.tf
|   |   main.tf
|   |   output.tf
|   |   provider.tf
|   |   variables.tf
|   |   versions.tf
|   |
|   \---modules
|       \---generic
|               locals.tf
|               main.tf
|               output.tf
|               variables_aws_api_gateway.tf
|               variables_aws_cognito.tf
|               variables_aws_ecr_repository.tf
|               variables_aws_lambda_event_source_mapping.tf
|               variables_lambda_function.tf
|               variables_lambda_permission.tf
|               versions.tf
|
\---src
        lambda_function.py
```

##  **Modules Generic**

* This generic module executes the download of remote modules from the repository terraform-modules-remotes.
  * The generic module is located in the directory ./iac/modules/generic.

- This project utilization modules:
  * [x] [aws_ecr_repositorys](https://github.com/team-tech-challenge/terraform-modules-remotes/tree/main/aws_ecr_repository)
  * [x] [aws_ecr_repository_policy](https://github.com/team-tech-challenge/terraform-modules-remotes/tree/main/aws_ecr_lifecycle_policy)
  * [x] [aws_lambda_function](https://github.com/team-tech-challenge/terraform-modules-remotes/tree/main/aws_lambda_function)
  * [x] [aws_lambda_permission](https://github.com/team-tech-challenge/terraform-modules-remotes/tree/main/aws_lambda_permission)
  * [x] [aws_api_gateway_rest_api](https://github.com/team-tech-challenge/terraform-modules-remotes/tree/main/aws_api_gateway_rest_api)
  * [x] [aws_api_gateway_resource](https://github.com/team-tech-challenge/terraform-modules-remotes/tree/main/aws_api_gateway_resource)
  * [x] [aws_api_gateway_method](https://github.com/team-tech-challenge/terraform-modules-remotes/tree/main/aws_api_gateway_method)
  * [x] [aws_api_gateway_integration](https://github.com/team-tech-challenge/terraform-modules-remotes/tree/main/aws_api_gateway_integration)
  * [x] [aws_api_gateway_deployment](https://github.com/team-tech-challenge/terraform-modules-remotes/tree/main/aws_api_gateway_deployment)
  * [x] [aws_api_gateway_stage](https://github.com/team-tech-challenge/terraform-modules-remotes/tree/main/aws_api_gateway_stage)


## **Lambda Function**
The lambda_function.py is a key component of this repository, which contains Terraform modules for AWS resources. This function enables the login in an Amazon Cognito User Pool by collecting username, password and email, after this it return a token to use the other endpoint of the service.

---
**Key Features:**

Receives User Credentials: The function accepts an event containing the username and password.
Authenticates User: It uses the provided credentials to authenticate the user in Cognito and return token.
Handles Errors: Provides appropriate error messages if the authentication fails.

---
**How It Works:**

Necessary Imports: Utilizes libraries such as boto3 for interacting with Cognito and hmac for generating an authentication hash.

Calculates Secret Hash: Generates a secret hash using HMAC and SHA-256, which is required for the authentication request.

Event Handling: Processes the incoming event to extract user credentials.

User Authentication in Cognito: Attempts to authenticate the user and returns the authentication result or an error response. if it's okay on the request, so the response will return a token to use the other endpoints.


**Example Usage:**
The event should follow this structure:


```bash
curl --location 'https://techchallenge.com.br/auth/token' \
--header 'Content-Type: application/json' \
--data-raw '{
    "username": "111.111.111.11",
    "password": "Chm@20!!,"
}'
```

---
**Common Errors:**

Invalid Username or Password: Returns an error if the username or password is incorrect.

User Not Found: If the user does not exist in the Cognito User Pool, an appropriate error message is returned.