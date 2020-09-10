variable "vpc_cidr" {
  description = "Choose Cidr for vpc"
  type        = string
  default     = "10.20.0.0/16"
}
variable "region" {
  description = "Choose region for your stack"
  type        = string
  default     = "us-west-2"
}
variable "web_ec2_count" {
  description = "Choose number of EC2 instances for your stack"
  type        = string
  default     = 2
}
variable "nat_amis" {
  type = map
  default = {
    us-west-2 = "ami-9fa343e7"
  }
}
variable "web_amis" {
  type = map
  default = {
    us-west-2 = "ami-9fa343e7"
  }
}
variable "web_instance_type" {
  description = "Choose instance type for your web"
  type        = string
  default     = "t2.micro"
}
variable "my_app_s3_bucket" {
  default = "javahome-app-dev"
}

variable "web_tags" {
  type = map
  default = {
    name = "Webserver"
  }
}
