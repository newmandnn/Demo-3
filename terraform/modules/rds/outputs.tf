output "rds_hostname" {
  value = aws_db_instance.demo_db_instance.address
}

output "rds_password" {
  value = random_password.password_rds.result
}

output "rds_port" {
  description = "RDS instance port"
  value       = aws_db_instance.demo_db_instance.port
  //sensitive   = true
}

output "rds_username" {
  description = "RDS instance root username"
  value       = aws_db_instance.demo_db_instance.username
  //sensitive   = true
}
