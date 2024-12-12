variable "db_username" {
  description = "O nome de usuário do banco de dados"
  type        = string
}

variable "db_password" {
  description = "A senha do banco de dados"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Nome do banco de dados"
  type        = string
}

variable "region" {
  type = string
  default = "us-east-1"
}
