variable "lambda_function_name" {
  type        = string
  description = "The name of the AWS Lambda function."
  default     = null
}

variable "lambda_memory_size" {
  type        = number
  description = "The amount of memory allocated to the Lambda function in MB."
  default     = 128
}

variable "lambda_timeout" {
  type        = number
  description = "The maximum execution time of the Lambda function in seconds."
  default     = 30
}

variable "lambda_description" {
  type        = string
  description = "A description of the AWS Lambda function."
  default     = null
}

variable "lambda_image_uri" {
  type        = string
  description = "URI of the container image."
  default     = null
}

variable "lambda_tags" {
  type        = map(string)
  description = "Defines tags to manage and control resources within the AWS environment."
  default = {
    ManagedBy = "Terraform"
  }
}

variable "lambda_package_type" {
  type        = string
  description = "The packaging type of the Lambda function (e.g., Zip or Image)."
  default     = "Image"
}

variable "lambda_source_code_hash" {
  type        = string
  description = "Used to trigger updates in Lambda when the source code changes."
  default     = null
}

variable "lambda_ephemeral_storage" {
  type        = number
  description = "The size of ephemeral storage allocated for the Lambda function in MB."
  default     = 512
}

variable "create_aws_lambda_function" {
  description = "Whether to create the lambda function"
  type        = bool
  default     = true
}

variable "integration_type" {
  description = "The type of integration, e.g., 'SQS', 'SNS', 'EventBridge'."
  type        = string
  default     = null
}

variable "lambda_environment" {
  description = "A map of environment variables that will be provided to the Lambda function. This allows you to dynamically adjust the runtime environment of your function without modifying the underlying code. Each environment variable is a key-value pair that can be used within the Lambda function to adapt its behavior or to provide essential configuration information."
  type        = map(string)
  default     = null
}


variable "lambda_layers" {
  description = "List of Lambda Layer Version ARNs (maximum of 5) to attach to the Lambda function."
  type        = list(string)
  default     = null
}


variable "lambda_tracing_config" {
  description = "The tracing configuration for the Lambda function. Specify 'Active' to enable X-Ray tracing or 'PassThrough' to use the tracing setting from the calling service."
  type        = string
  default     = "PassThrough"
}


variable "lambda_security_group_ids" {
  description = "A list of security group IDs to associate with the Lambda function."
  type        = list(string)
  default     = null
}


variable "lambda_subnet_ids" {
  description = "A list of subnet IDs to associate with the Lambda function."
  type        = list(string)
  default     = null

}