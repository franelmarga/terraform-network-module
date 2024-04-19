
# creating subnets according to the terraform.tfvars 

resource "aws_subnet" "public" {
  count                   = length(var.availability_zones)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnets[element(var.availability_zones, count.index)]
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-${element(var.availability_zones, count.index)}-${var.env}"
  }
}

resource "aws_subnet" "private" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnets[element(var.availability_zones, count.index)]
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = "private-subnet-${element(var.availability_zones, count.index)}-${var.env}"
  }
}
