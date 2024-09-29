variable "ecr_tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default = {
    ManagedBy = "Terraform"
  }
}

variable "create_aws_ecr_repository" {
  description = "Whether to create the ECR repository"
  type        = bool
  default     = null
}