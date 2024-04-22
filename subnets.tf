
# creating subnets according to the terraform.tfvars 

resource "aws_subnet" "public" {
  count      = length(var.public_subnets_cidrs) #iterator
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnets_cidrs[count.index] #iterating through the pub. subnets vector

  #this line is using the element function to get the availability zone for each subnet.
  #the count.index % length(data.aws_availability_zones.available.names) is used in order to not put the same AZ for all the subnets

  availability_zone       = element(data.aws_availability_zones.available.names, count.index % length(data.aws_availability_zones.available.names))
  map_public_ip_on_launch = true #this is to enable the public IP for the instances in the public subnets

  tags = {
    Name = "public-subnet-${count.index}"
  }
}

resource "aws_subnet" "private" {
  count             = length(var.private_subnets_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnets_cidrs[count.index]
  availability_zone = element(data.aws_availability_zones.available.names, count.index % length(data.aws_availability_zones.available.names))

  tags = {
    Name = "private-subnet-${count.index}"
  }
}
