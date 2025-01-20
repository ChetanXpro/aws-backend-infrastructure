resource "aws_db_instance" "default" {
  identifier           = lower("${var.instance_name}-db")
  engine               = "postgres"
  engine_version       = "16.3"
  instance_class       = var.db_instance_class
  allocated_storage    = 20
  storage_type         = "gp2"
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.postgres16"
  skip_final_snapshot  = true

  vpc_security_group_ids = [aws_security_group.rds.id]
  db_subnet_group_name   = aws_db_subnet_group.default.name

  tags = {
    Name = "${var.instance_name}-database"
  }
}

resource "aws_db_subnet_group" "default" {
  name       = lower("${var.instance_name}-db-subnet-group")
  subnet_ids = [aws_subnet.main.id, aws_subnet.secondary.id]

  tags = {
    Name = "${var.instance_name} DB subnet group"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}