################################################
#
#            AWS ECR REPOSITORY
#
################################################

module "aws_ecr_repository" {
  source = "git::https://github.com/team-tech-challenge/terraform-modules-remotes.git//aws_ecr_repository?ref=main"

  ecr_repository_name  = var.lambda_function_name
  image_tag_mutability = "MUTABLE"
  scan_on_push         = true
  ecr_tags = merge({
    "Name" = var.lambda_function_name
    },
    var.lambda_tags
  )
  create_ecr_repository = var.create_aws_ecr_repository
}

################################################
#
#            AWS ECR POLICY
#
################################################

module "aws_ecr_repository_policy" {
  source = "git::https://github.com/team-tech-challenge/terraform-modules-remotes.git//aws_ecr_lifecycle_policy?ref=main"

  ecr_repository_name_policy      = module.aws_ecr_repository.ecr_repository_name
  create_ecr_lifecycle_repository = var.create_aws_ecr_repository

  depends_on = [
    module.aws_ecr_repository
  ]
}

################################################
#
#            LAMBDA FUNCTION
#
################################################

module "aws_lambda_function" {
  source = "git::https://github.com/team-tech-challenge/terraform-modules-remotes.git//aws_lambda_function?ref=feat/create-module-cognito"

  function_name = var.lambda_function_name
  role          = "arn:aws:iam::575403774961:role/LabRole"
  memory_size   = var.lambda_memory_size
  timeout       = var.lambda_timeout
  description   = var.lambda_description
  architectures = ["arm64"]
  image_uri     = var.lambda_image_uri
  tags = merge({
    "Name" = var.lambda_function_name
    },
    var.lambda_tags
  )
  package_type = var.lambda_package_type
  environment = merge({
    "client_id"     = data.aws_cognito_user_pool_client.existing_client.client_id,
    "client_secret" = data.aws_cognito_user_pool_client.existing_client.client_secret,
    "user_pool_id"  = data.aws_cognito_user_pool_client.existing_client.user_pool_id,
  })
  security_group_ids     = var.lambda_security_group_ids
  subnet_ids             = var.lambda_subnet_ids
  layers                 = var.lambda_layers
  tracing_config         = var.lambda_tracing_config
  source_code_hash       = var.lambda_source_code_hash
  ephemeral_storage      = var.lambda_ephemeral_storage
  create_lambda_function = var.create_aws_lambda_function
}

################################################
#
#            AWS LAMBDA PERMISSION
#
################################################

module "aws_lambda_permission" {
  source = "git::https://github.com/team-tech-challenge/terraform-modules-remotes.git//aws_lambda_permission?ref=main"

  statement_id             = var.lambda_statement_id
  action                   = var.lambda_action
  function_name            = var.lambda_function_name
  principal                = var.lambda_principal
  source_arn               = local.lambda_source_arn
  create_lambda_permission = var.create_aws_lambda_permission

  depends_on = [
    module.aws_lambda_function
  ]
}

################################################
#
#            API GATEWAY REST API
#
################################################

module "aws_api_gateway_rest_api" {
  source = "git::https://github.com/team-tech-challenge/terraform-modules-remotes.git//aws_api_gateway_rest_api?ref=main"

  api_name        = var.api_gateway_name
  api_description = var.api_gateway_description
  tags = merge({
    "Name" = var.api_gateway_name
    },
    var.lambda_tags
  )
  create_api_gateway_rest_api = var.create_api_gateway

}

################################################
#
#            API GATEWAY RESOURCE
#
################################################

module "aws_api_gateway_resource" {
  source = "git::https://github.com/team-tech-challenge/terraform-modules-remotes.git//aws_api_gateway_resource?ref=main"

  rest_api_id = module.aws_api_gateway_rest_api.rest_api_id
  parent_id   = module.aws_api_gateway_rest_api.rest_parent_id
  path_part   = var.api_gateway_resource_path_part

  create_api_gateway_resource = var.create_api_gateway

}

################################################
#
#            API GATEWAY METHOD
#
################################################

module "aws_api_gateway_method" {
  source = "git::https://github.com/team-tech-challenge/terraform-modules-remotes.git//aws_api_gateway_method?ref=main"

  rest_api_id   = module.aws_api_gateway_rest_api.rest_api_id
  resource_id   = module.aws_api_gateway_resource.resource_id
  http_method   = var.api_gateway_http_method
  authorization = var.api_gateway_authorization

  create_api_gateway_method = var.create_api_gateway

}

################################################
#
#            API GATEWAY INTEGRATION
#
################################################

module "aws_api_gateway_integration" {
  source = "git::https://github.com/team-tech-challenge/terraform-modules-remotes.git//aws_api_gateway_integration?ref=main"

  rest_api_id = module.aws_api_gateway_rest_api.rest_api_id
  resource_id = module.aws_api_gateway_resource.resource_id
  http_method = module.aws_api_gateway_method.http_method

  integration_http_method = var.integration_api_http_method
  type                    = var.integration_api_type
  uri                     = "arn:aws:apigateway:${local.aws_region}:lambda:path/2015-03-31/functions/${module.aws_lambda_function.ARN}/invocations"

  create_api_gateway_integration = var.create_api_gateway

}

################################################
#
#            API GATEWAY DEPLOYMENT
#
################################################

module "aws_api_gateway_deployment" {
  source = "git::https://github.com/team-tech-challenge/terraform-modules-remotes.git//aws_api_gateway_deployment?ref=main"

  api_gateway_rest_api_id = module.aws_api_gateway_rest_api.rest_api_id
  api_gateway_description = var.api_gateway_description

  create_api_gateway_deployment = var.create_api_gateway

  depends_on = [
    module.aws_api_gateway_integration
  ]
}

################################################
#
#            API GATEWAY STAGE
#
################################################

module "aws_api_gateway_stage" {
  source = "git::https://github.com/team-tech-challenge/terraform-modules-remotes.git//aws_api_gateway_stage?ref=main"

  api_deployment_id     = module.aws_api_gateway_deployment.deployment_id
  api_rest_api_id       = module.aws_api_gateway_rest_api.rest_api_id
  api_stage_name        = var.api_gateway_stage_name
  api_stage_description = var.api_gateway_description
  tags = merge({
    "Name" = var.api_gateway_name
    },
    var.lambda_tags
  )
  create_api_gateway_stage = var.create_api_gateway
}
