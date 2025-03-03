# Generate a secure random password (ephemeral, not stored in state)
resource "random_password" "db_password" {
  length           = 16
  special          = false
  numeric          = true
  upper            = true
  lower            = true
}

resource "aws_db_instance" "example2" {
  allocated_storage    = 20
  engine              = "mysql"
  instance_class      = "db.t3.micro"
  db_name             = "exampledb2"
  username           = "admin"

  # Use the new write-only attribute (password will NOT be stored in state)
  master_password_wo = random_password.db_password.result

  storage_encrypted  = true
  skip_final_snapshot = true
}

output "rds_instance_endpoint" {
  value = aws_db_instance.example2.endpoint
}