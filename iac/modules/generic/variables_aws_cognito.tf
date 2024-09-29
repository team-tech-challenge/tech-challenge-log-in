variable "cognito_user_pool_name" {
  type        = string
  description = "The name of the AWS Cognito User Pool."
  default     = null
}

variable "create_cognito_user_pool" {
  description = "Whether to create the Cognito User Pool."
  type        = bool
  default     = false
}