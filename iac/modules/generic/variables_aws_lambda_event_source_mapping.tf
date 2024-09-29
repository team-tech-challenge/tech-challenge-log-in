variable "lambda_batch_size" {
  description = "The largest number of records that Lambda will retrieve from your event source at the time of invocation."
  type        = number
  default     = null
}

variable "event_source_arns" {
  description = "ARN of the event source.This is the ARN of the Amazon Kinesis or the Amazon DynamoDB stream, or the ARN of the Amazon SQS queue that is the source of events."
  type        = list(string)
  default     = null
}