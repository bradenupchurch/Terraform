locals {
  env_tag = {
    Environment = terraform.workspace
  }
  web_tags = merge(var.web_tags, local.env_tag)
}
resource "aws_instance" "web" {
  #resource "aws_iam_instance_profile" "web" {
  count         = var.web_ec2_count
  ami           = var.web_amis[var.region]
  instance_type = var.web_instance_type
  subnet_id     = local.pub_sub_ids[count.index]
  tags          = var.web_tags
  user_data     = file("scripts/apache.sh")
  #problem:
  iam_instance_profile   = "aws_iam_instance_profile.ec2_s3_profile.name"
  vpc_security_group_ids = ["${aws_security_group.web_sg.id}"]
  key_name               = "${aws_key_pair.web.key_name}"
}
resource "aws_key_pair" "web" {
  key_name   = "javahome-web"
  public_key = "${file("scripts/web.pub")}"
}
