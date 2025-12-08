terraform {
  backend "s3" {
    bucket       = "bacc-bucct1"
    key          = "dev/Terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
