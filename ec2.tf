resource "aws_instance" "backend_server" {
  ami                    = var.ami_id
  instance_type          = var.backend_instance_type
  key_name               = aws_key_pair.app_server_key.key_name
  subnet_id              = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.backend_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.backend_s3_profile.name

  tags = {
    Name = "${var.instance_name}-backend"
  }

  root_block_device {
    volume_type = "gp3"
    volume_size = 8
  }
}

resource "aws_eip_association" "backend_eip_assoc" {
  instance_id   = aws_instance.backend_server.id
  allocation_id = aws_eip.backend_eip.id
}