output "server_public_ip" {
  value       = aws_instance.mujeebah_server.public_ip
  description = "Public IP address of the EC2 instance"
}

