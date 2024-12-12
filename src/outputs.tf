output "rds_endpoint" {
  description = "Endpoint do RDS MySQL"
  value       = aws_db_instance.default.endpoint
}
