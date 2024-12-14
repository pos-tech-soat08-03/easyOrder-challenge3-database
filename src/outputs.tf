output "rds_db_name" {
  description = "Nome do banco de dados do RDS MySQL"
  value       = var.db_name
}

output "rds_username" {
  description = "Usuário do RDS MySQL"
  value = aws_db_instance.rds_instance.username
}

output "rds_password" {
  description = "Senha do RDS MySQL"
  value = aws_db_instance.rds_instance.password
  sensitive = true
}

output "rds_instance_id" {
  description = "ID da instância do RDS MySQL"
  value       = aws_db_instance.rds_instance.id
}

output "rds_endpoint" {
  description = "Endpoint do RDS MySQL"
  value       = aws_db_instance.rds_instance.endpoint
}

output "rds_instance_arn" {
  description = "ARN da instância do RDS MySQL"
  value       = aws_db_instance.rds_instance.arn
}

output "rds_instance_address" {
  description = "Endereço da instância do RDS MySQL"
  value       = aws_db_instance.rds_instance.address
}

output "rds_instance_port" {
  description = "Porta da instância do RDS MySQL"
  value       = aws_db_instance.rds_instance.port
}

output "rds_instance_status" {
  description = "Status da instância do RDS MySQL"
  value       = aws_db_instance.rds_instance.status
}

