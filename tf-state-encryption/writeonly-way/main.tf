data "aws_ssm_parameter" "db_password" {
  name = "/dev/db_password"
}

resource "aws_db_instance" "example2" {
  allocated_storage = 20
  engine            = "mysql"
  instance_class    = "db.t3.micro"
  db_name           = "exampledb2"
  username          = "admin"

  # Use the new write-only attribute (password will NOT be stored in state)
  password_wo         = data.aws_ssm_parameter.db_password.value
  password_wo_version = 1

  storage_encrypted   = true
  skip_final_snapshot = true
}

output "rds_instance_endpoint" {
  value = aws_db_instance.example2.endpoint
}