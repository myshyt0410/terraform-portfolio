output "alb_dns_name" {
  description = "ALBのDNS名"
  value       = aws_lb.main.dns_name
}

output "ec2_1a_public_ip" {
  description = "EC2 (1a) のパブリックIP"
  value       = aws_instance.ec2_1a.public_ip
}

output "ec2_1c_public_ip" {
  description = "EC2 (1c) のパブリックIP"
  value       = aws_instance.ec2_1c.public_ip
}

output "rds_endpoint" {
  description = "RDSエンドポイント"
  value       = aws_db_instance.main.endpoint
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}
