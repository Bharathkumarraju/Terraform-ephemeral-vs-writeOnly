#  Secure password generation (ephemeral & never stored in state)
resource "random_password" "db_password" {
  length           = 16
  special          = true
  override_special = "!@#%^&*()-_=+[]{}"
}

#  Secure RDS instance without storing the password in state
resource "aws_db_instance" "example" {
  allocated_storage    = 20
  engine              = "mysql"
  instance_class      = "db.t3.micro"
  db_name             = "exampledb"
  username           = "admin"

  #  Using write-only password (WILL NOT be stored in state!)
  master_password_wo = random_password.db_password.result

  storage_encrypted  = true
  skip_final_snapshot = true
}

#  Output RDS instance details (password not included)
output "rds_instance_endpoint" {
  value = aws_db_instance.example.endpoint
}