# terraform-modules-remotes

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

