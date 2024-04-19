
# Global declaration for the ACL (public)

resource "aws_network_acl" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "public-acl-${var.env}"
  }
}

# Association of the ACL with the public subnets

resource "aws_network_acl_association" "public" {
  count          = length(var.public_subnets)
  network_acl_id = aws_network_acl.public.id
  subnet_id      = element(aws_subnet.public.*.id, count.index)
}

# Global declaration for the ACL (private)

resource "aws_network_acl" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "private-acl-${var.env}"
  }
}

# Association of the ACL with the private subnets

resource "aws_network_acl_association" "private" {
  count          = length(var.private_subnets)
  network_acl_id = aws_network_acl.private.id
  subnet_id      = element(aws_subnet.private.*.id, count.index)
}

# ACL Rules for public subnets
resource "aws_network_acl_rule" "public_inbound" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 100
  rule_action    = "allow"
  egress         = false
  protocol       = "tcp"
  from_port      = 80
  to_port        = 80
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "public_outbound" {
  network_acl_id = aws_network_acl.public.id
  rule_number    = 100
  rule_action    = "allow"
  egress         = true
  protocol       = "-1"
  from_port      = 0
  to_port        = 0
  cidr_block     = "0.0.0.0/0"
}

# ACL Rules for private subnets
resource "aws_network_acl_rule" "private_inbound" {
  network_acl_id = aws_network_acl.private.id
  rule_number    = 100
  rule_action    = "allow"
  egress         = false
  protocol       = "tcp"
  from_port      = 443
  to_port        = 443
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "private_outbound" {
  network_acl_id = aws_network_acl.private.id
  rule_number    = 100
  rule_action    = "allow"
  egress         = true
  protocol       = "-1"
  from_port      = 0
  to_port        = 0
  cidr_block     = "0.0.0.0/0"
}

