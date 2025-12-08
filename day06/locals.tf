locals {
  bucket_name = "${var.channel_name}-bucket-${var.environment}-${var.region_name}"
  vpc_name    = "${var.vpc_name}-VPC"

}
