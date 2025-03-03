variable "db_password_arn" {
  description = "DB Password arn"
  type        = string
  default     = "arn:aws:ssm:ap-south-1:172586632398:parameter/dev/db_password"
}

