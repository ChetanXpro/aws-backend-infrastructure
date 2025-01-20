provider "aws" {
  region  = var.region
  profile = var.aws_profile
}

resource "aws_key_pair" "app_server_key" {
  key_name   = "${var.instance_name}-key"
  public_key = file(var.public_key_path)
}
