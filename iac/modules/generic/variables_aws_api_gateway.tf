variable "api_gateway_name" {
  description = "The name of the API Gateway API"
  type        = string
  default     = null
}

variable "api_gateway_description" {
  description = "The description of the API Gateway API"
  type        = string
  default     = null
}

variable "api_gateway_resource_path_part" {
  description = "The path part of the API resource"
  default     = "{proxy+}"
  type        = string
}

variable "api_gateway_http_method" {
  description = "The HTTP method (GET, POST, PUT, DELETE, HEAD, OPTIONS, ANY) for the resource"
  default     = "ANY"
  type        = string
}

variable "api_gateway_authorization" {
  description = "The type of authorization used for the method (NONE, AWS_IAM, CUSTOM, COGNITO_USER_POOLS)"
  default     = "NONE"
  type        = string
}

variable "integration_api_type" {
  description = "The type of integration (AWS, AWS_PROXY, HTTP, HTTP_PROXY, MOCK)"
  default     = "AWS_PROXY"
  type        = string
}

variable "integration_api_http_method" {
  description = "The HTTP method for the integration (POST for Lambda functions)"
  default     = "POST"
  type        = string
}

variable "api_gateway_stage_name" {
  description = "The URI for the integration (Lambda function ARN)"
  type        = string
  default     = null
}

variable "create_api_gateway" {
  description = "Create the API Gateway"
  type        = bool
  default     = false
}