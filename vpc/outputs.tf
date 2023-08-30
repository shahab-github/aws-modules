output "vpc_id" {
    value = aws_vpc.myvpc.id
}

output "aws_subnet_pub" {
  value = aws_subnet.pub-sub.id
}
