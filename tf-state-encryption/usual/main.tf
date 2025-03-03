data "aws_ssm_parameter" "db_password" {
  name = "/dev/db_password"
}

#  Password for RDS stored in state
resource "aws_db_instance" "example1" {
  allocated_storage = 20
  engine            = "mysql"
  instance_class    = "db.t3.micro"
  db_name           = "exampledb1"
  username          = "admin"

  password = data.aws_ssm_parameter.db_password.value

  storage_encrypted   = true
  skip_final_snapshot = true
}


output "rds_instance_endpoint" {
  value = aws_db_instance.example1.endpoint
}