output "lambda_function_name" {
  value = module.aws_lambda_function.Name
}

output "lambda_memory_size" {
  value = module.aws_lambda_function.Memory
}

output "lambda_description" {
  value = module.aws_lambda_function.Description
}

output "lambda_tags" {
  value = module.aws_lambda_function.Tags
}

output "lambda_role_arn" {
  value = module.aws_lambda_function.Role
}
