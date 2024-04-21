
# We create the necessay Elastic iP and NAT Gateway resources for each public subnet that we have defined in terraform.tfvars, we use count for that,
# and the boolean variable create_nat_gateway to enable or disable the creation of the NAT Gateway resources.

# ALSO note that we use element() to loop through all the public subnets and associate them with the NAT Gateway resources!!

resource "aws_eip" "nat" {
  count  = var.create_nat_gateway ? length(var.public_subnets_cidrs) : 0
  domain = "vpc"
  tags = {
    Name = "nat-eip-${count.index}-${var.env}"
  }
}

resource "aws_nat_gateway" "main" {
  count         = var.create_nat_gateway ? length(var.public_subnets_cidrs) : 0
  subnet_id     = element(aws_subnet.public.*.id, count.index)
  allocation_id = aws_eip.nat[count.index].id

  tags = {
    Name = "nat-gateway-${count.index}-${var.env}"
  }
}

