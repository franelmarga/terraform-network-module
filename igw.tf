
# Internet Gateway associated with the VPC. This allows the VPC to connect to the internet through the public subnets. 

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw-${var.env}"
  }
}
