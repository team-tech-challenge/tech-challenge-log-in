locals {
  lambda_source_arn = (
    var.integration_type == "ApiGateway" ? "${module.aws_api_gateway_rest_api.execution_arn}/*" :
    ""
  )
}

locals {
  aws_region = "us-east-1"
}