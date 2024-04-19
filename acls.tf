
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
