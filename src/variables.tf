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
  #default = "us-east-1"
}

# variable "bucket" {
#   description = "Bucket S3 para state do Terraform - Database (este terraform)"
# }

# variable "key" {
#   description = "Bucket S3 para state do Terraform - Database (este terraform)"
# }

variable "bucket_infra" {
  description = "Bucket S3 para state do Terraform - Infra"
}

variable "key_infra" {
  description = "Bucket S3 para state do Terraform - Infra"
}

data "terraform_remote_state" "easyorder-infra" {
  backend = "s3"
  config = {
    bucket = var.bucket_infra
    key    = var.key_infra
    region = var.region
  }
}
