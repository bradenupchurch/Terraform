resource "aws_vpc" "my_app" {

  cidr_block       = var.vpc_cidr
  instance_tenancy = "dedicated"

  tags = {
    Name        = "JavaHomeVpc"
    Environment = terraform.workspace
  }
}