
variable "environment" {
  default = "dev"
  type    = string
}

variable "region_name" {
  type    = string
  default = "us-east-1"
}
variable "vpc_name" {
  type    = string
  default = "my-vpcc"

}
variable "instance_count" {

  type = number
}
variable "monit" {
  type    = bool
  default = true

}
variable "assosciate_ip" {
  type    = bool
  default = true

}
variable "cidr_block" {
  type    = list(string)
  default = ["10.0.0.0/8", "192.168.0.0/16", "172.16.0.0/12"]
}
variable "allowed_vm_types" {
  type    = list(string)
  default = ["t1.micro", "t2.micro", "t3.micro"]
}
variable "allowed_region" {
  type    = set(string)
  default = ["us-east-1a", "us-east-2a", "eu-west-1a", "eu-west-1a"]

}
variable "tags" {
  type = map(string)
  default = {

    Environment = "dev"
    Name        = "dev_inst"
    created_by  = "Terraform"


  }

}
variable "ingress_rule" {
  type    = tuple([number, string, number])
  default = [441, "tcp", 443]

}
variable "config" {
  type = object({
    region         = string
    monitoring     = bool
    instance_count = number
  })
  default = {
    region         = "us-east-1a"
    monitoring     = true
    instance_count = 1
  }

}
