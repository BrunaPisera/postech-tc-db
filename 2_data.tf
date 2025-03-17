data "aws_iam_role" "labrole" {
  name = "LabRole"
}

data "aws_vpc" "vpc" {
  cidr_block = var.cidrBlocks
}

data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
}

data "aws_subnets" "private_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }

  filter {
    name   = "tag:Name"
    values = ["private_subnet"]
  }
}

data "aws_subnet" "subnet" {
  for_each = toset(data.aws_subnets.subnets.ids)
  id       = each.value
}

data "aws_subnet" "private_subnet" {
  for_each = toset((data.aws_subnets.private_subnets.ids))
  id       = each.value
}