terraform {
  backend "s3" {
    bucket = "tc-tf-backend-rds"
    key    = "backend/terraform.tfstate"
    region = "us-east-1"
  }
}