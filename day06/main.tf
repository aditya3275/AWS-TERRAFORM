









resource "aws_s3_bucket" "Firstbuck" {
  bucket = local.bucket_name

  tags = {
    Name        = local.bucket_name
    Environment = var.environment
  }
}




resource "aws_vpc" "my-vpcc" {
  cidr_block = "10.0.0.0/16"



  tags = {
    Name        = local.vpc_name
    Environment = var.environment
  }

}
resource "aws_instance" "my_ec2" {
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type = "t3.micro"



  tags = {
    Environment = var.environment
    Name        = "${var.environment}-ec2-instance"
  }



}





