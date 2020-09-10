provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "javahome-tf-12"
    key            = "terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "javahome-tf"
  }
}
# resource "aws_vpc" "my_vpc" {
#   count            = terraform.workspace == "dev" ? 0 : 1
#   cidr_block       = var.vpc_cidr
#   instance_tenancy = "default"
#
#   tags = {
#     Name        = "JavaHomeVpc"
#     Environment = terraform.workspace
#     Location    = "US"
#   }
# }
#

# output "vpc_cidr" {
#   value = "${aws_vpc.my_vpc.cidr_block}"
# }
