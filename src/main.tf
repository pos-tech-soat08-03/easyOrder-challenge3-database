provider "aws" {
  region = var.region
}

data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "seu-bucket"
    key    = "path/to/eks/terraform.tfstate"
    region = "us-east-1"
  }
}

# Criar um grupo de segurança para o RDS
resource "aws_security_group" "rds_security_group" {
  name        = "rds-security-group"
  description = "Allow access to RDS"
  vpc_id      = data.terraform_remote_state.eks.outputs.vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [data.terraform_remote_state.eks.outputs.security_group_id] # Permitir acesso do EKS
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = data.terraform_remote_state.eks.outputs.subnet_ids
}

# Criar a instância RDS
resource "aws_db_instance" "rds_instance" {
  identifier                = "my-rds-instance"
  engine                   = "mysql"
  engine_version           = "8.0"
  instance_class           = "db.t3.micro"
  allocated_storage         = 20
  username                 = var.db_username
  password                 = var.db_password
  db_name                  = var.db_name
  skip_final_snapshot      = true
  vpc_security_group_ids    = [data.terraform_remote_state.eks.outputs.security_group_id]
  db_subnet_group_name      = aws_db_subnet_group.rds_subnet_group.name
}