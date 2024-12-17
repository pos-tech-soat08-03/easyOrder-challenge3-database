
# Criar um grupo de segurança para o RDS
resource "aws_security_group" "rds_security_group" {
  name        = "rds-security-group"
  description = "Allow access to RDS"
  vpc_id      = data.terraform_remote_state.easyorder-infra.outputs.vpc_id

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [data.terraform_remote_state.easyorder-infra.outputs.security_group_id] # Permitir acesso do EKS
    cidr_blocks     = ["0.0.0.0/0"]
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
  subnet_ids = data.terraform_remote_state.easyorder-infra.outputs.private_subnet_ids
}

# Criar a instância RDS
resource "aws_db_instance" "rds_instance" {
  identifier             = "easyorder-rds-instance"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  username               = var.db_username
  password               = var.db_password
  db_name                = var.db_name
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.rds_security_group.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  publicly_accessible    = true
}

