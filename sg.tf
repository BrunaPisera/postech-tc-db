resource "aws_security_group" "rds_sg" {
  name   = "sg_rds_vid_proc"
  vpc_id = data.aws_vpc.vpc.id

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  ingress {
    cidr_blocks = [data.aws_vpc.vpc.cidr_block] # Permitir acesso somente dentro da VPC
    from_port   = 5432                          # Porta padrão do PostgreSQL
    to_port     = 5432
    protocol    = "tcp"
  }
}