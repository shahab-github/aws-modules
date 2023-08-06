# create a VPC
resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr_block
  enable_dns_hostnames   = true

  tags = {
    "Name" = "myvpc"
  }
}

# Create an Internet Gateway (IGW) and attach it to the VPC created above:
resource "aws_internet_gateway" "igw" {
    vpc_id     = aws_vpc.myvpc.id
    tags = {
        "Name" = "myvpc-igw"
    }
}

resource "aws_subnet" "pub-sub" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = ["192.168.1.0/24"]
  availability_zone = "us-east-1a"
}

resource "aws_route_table" "pub-rt" {
  vpc_id = "${aws_vpc.myvpc.id}"
  route {
    cidr_block  = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
    depends_on = [aws_internet_gateway.igw]
  }
}

resource "aws_route_table_association" "pubrt-ast" {
    subnet_id      = "${aws_subnet.pub-sub.id}"
    route_table_id = "${aws_route_table.pub-rt.id}"  
}