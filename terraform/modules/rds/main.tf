resource "aws_db_subnet_group" "subnet" {
  name       = var.subnet_name
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "demo_db_instance" {
  identifier             = "instance"
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "15.3"
  username               = var.username
  password               = random_password.password_rds.result
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.subnet.name
  vpc_security_group_ids = [aws_security_group.security_group.id]
  parameter_group_name   = aws_db_parameter_group.demo_parameter.name
  publicly_accessible    = true
}

resource "aws_db_parameter_group" "demo_parameter" {
  name   = "demo-aws-parameter-group"
  family = "postgres15"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}
