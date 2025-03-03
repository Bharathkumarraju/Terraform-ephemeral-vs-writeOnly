
# Fetch the SSM Parameter using `ephemeral` style
ephemeral "aws_ssm_parameter" "db_password_arn" {
  arn  = var.db_password_arn
}


resource "aws_db_instance" "example" {
  allocated_storage    = 20
  engine              = "mysql"
  instance_class      = "db.t3.micro"
  db_name             = "exampledb"
  username           = "admin"

  # Use ephemeral password securely (NOT stored in state)
  password           = ephemeral.aws_ssm_parameter.db_password.value

  storage_encrypted  = true
  skip_final_snapshot = true
}