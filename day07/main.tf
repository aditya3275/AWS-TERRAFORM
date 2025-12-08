
resource "aws_instance" "my_ec2" {
  ami                         = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type               = var.allowed_vm_types[2]       #list
  count                       = var.instance_count            #number
  region                      = tolist(var.allowed_region)[1] # set-list
  monitoring                  = var.monit                     # Bool
  associate_public_ip_address = var.config.monitoring         # Bool





  tags = var.tags



}
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"


  tags = var.tags
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.cidr_block[0]
  from_port         = var.ingress_rule[0]
  ip_protocol       = var.ingress_rule[1]
  to_port           = var.ingress_rule[2]
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}






