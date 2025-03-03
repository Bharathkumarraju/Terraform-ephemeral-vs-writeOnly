resource "random_password" "db_password" {
  length           = 16
  special          = false
  numeric          = true
  upper            = true
  lower            = true
}

resource "aws_db_instance" "example" {
  allocated_storage    = 20
  engine              = "mysql"
  instance_class      = "db.t3.micro"
  db_name             = "exampledb"
  username           = "admin"

  # Use generated password (Only letters + numbers)
  password = random_password.db_password.result

  storage_encrypted  = true
  skip_final_snapshot = true
}

output "rds_instance_endpoint" {
  value = aws_db_instance.example.endpoint
}