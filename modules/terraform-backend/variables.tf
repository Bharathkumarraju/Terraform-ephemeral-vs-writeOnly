variable "aws_kms_alias" {
  description = "Alias of the KMS key used for the state storage."
  type        = string
}

variable "tf_state_storage_bucket_name" {
  description = "Name of the state storage bucket."
  type        = string
}

variable "aws_account_id" {
  description = "AWS Account ID to grant KMS access to via key policy"
  type        = string
}
