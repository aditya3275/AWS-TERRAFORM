output "vpc_id" {
  value = aws_vpc.my-vpcc.id

}

output "ec2_id" {
  value = aws_instance.my_ec2.id

}
