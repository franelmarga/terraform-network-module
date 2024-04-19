resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.main.id

  # Deny all inbound traffic
  ingress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    description = "Deny all inbound traffic"
  }

  # Deny all outbound traffic
  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    description = "Deny all outbound traffic"
  }
}
