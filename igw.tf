
# Internet Gateway associated with the VPC. This allows the VPC to connect to the internet through the public subnets. 
# Private subnets must use a NAT Gateway to connect to the Internet Gateway and after that to the internet.

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw-${var.env}"
  }
}
