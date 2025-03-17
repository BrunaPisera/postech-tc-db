resource "aws_db_instance" "tc_pg_db" {
  identifier             = "tc-pg-db"
  engine                 = "postgres"
  engine_version         = "16.3"
  instance_class         = "db.t3.micro"
  allocated_storage      = 10
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.id
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  multi_az               = false
  publicly_accessible    = false
  username               = "tc3user"
  password               = "Posgraduation109283"
  db_name                = "vidproc"
  parameter_group_name   = "default.postgres16"
  skip_final_snapshot    = true # Definir como false em produção para fazer backup ao excluir
  tags = {
    Name = "VidProcDB"
  }
}