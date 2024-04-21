
# Global definition for the public route table

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "public-route-table-${var.env}"
  }
}

# looping to all the public subnets, and associating them with the route table. but we will just create on route table for the public subnets

resource "aws_route_table_association" "public" {
  count          = length(var.public_subnets_cidrs)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

# same with the private route table, but we will create one route table for each private subnet

resource "aws_route_table" "private" {
  count  = length(var.private_subnets_cidrs)
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main[count.index].id
  }

  tags = {
    Name = "private-route-table-${count.index}-${var.env}"
  }
}

resource "aws_route_table_association" "private" {
  count          = length(var.private_subnets_cidrs)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.private[count.index].id
}
