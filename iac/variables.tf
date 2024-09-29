variable "lambda_image_uri" {
  description = "The URI of the container image"
  type        = string
  default     = null
}

variable "workspace_environment" {
  type        = string
  default     = null
  description = "The environment of the workspace. Ex: dev, stg, prod"
}
