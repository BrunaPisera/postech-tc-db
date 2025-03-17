# RDS
resource "aws_db_subnet_group" "rds_subnet_group" {
  name        = "vidproc-db-subnet-group"
  subnet_ids  = [for subnet in data.aws_subnet.private_subnet : subnet.id if subnet.availability_zone != "${var.defaultRegion}e"]
  description = "Subnet group for my private PostgreSQL database"
}