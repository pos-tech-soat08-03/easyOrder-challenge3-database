output "rds_endpoint" {
  description = "Endpoint do RDS MySQL"
  value       = aws_db_instance.rds_instance.endpoint
}

output "rds_username" {
  description = "Usuário do RDS MySQL"
  value       = var.db_username
}

output "rds_db_name" {
  description = "Nome do banco de dados do RDS MySQL"
  value       = var.db_name
}

output "rds_security_group_id" {
  description = "ID do security group do RDS MySQL"
  value       = aws_security_group.rds_security_group.id
}

output "rds_subnet_group_id" {
  description = "ID do subnet group do RDS MySQL"
  value       = aws_db_subnet_group.rds_subnet_group.id
}

output "rds_instance_id" {
  description = "ID da instância do RDS MySQL"
  value       = aws_db_instance.rds_instance.id
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

