resource "aws_vpc" "intuitive_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "my-vpc"
  }
}

resource "aws_internet_gateway" "intuitive_igw" {
  vpc_id = aws_vpc.intuitive_vpc.id

  tags = {
    Name = "intuitive-igw"
  }
}

resource "aws_subnet" "public_subnets" {
  vpc_id                  = aws_vpc.intuitive_vpc.id
  cidr_block              = var.cidr_block
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "intuitive_subnet"
  }
}

}
