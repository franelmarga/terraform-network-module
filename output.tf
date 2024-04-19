output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the VPC created."
}

output "public_subnet_ids" {
  value       = aws_subnet.public.*.id
  description = "The IDs of the public subnets created."
}

output "private_subnet_ids" {
  value       = aws_subnet.private.*.id
  description = "The IDs of the private subnets created."
}

output "internet_gateway_id" {
  value       = aws_internet_gateway.main.id
  description = "The ID of the Internet Gateway."
}

output "public_network_acl_id" {
  value       = aws_network_acl.public.id
  description = "The ID of the public network ACL."
}

output "private_network_acl_id" {
  value       = aws_network_acl.private.id
  description = "The ID of the private network ACL."
}
