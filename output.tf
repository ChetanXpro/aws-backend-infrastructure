output "backend_instance_public_ip" {
  description = "Public IP address of the backend EC2 instance"
  value       = aws_instance.backend_server.public_ip
}

output "backend_elastic_ip" {
  value       = aws_eip.backend_eip.public_ip
  description = "The Elastic IP address associated with the backend server"
}

output "rds_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = aws_db_instance.default.endpoint
}