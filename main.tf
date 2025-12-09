resource "aws_s3_bucket" "bucket1leel" {
  count  = 2
  bucket = var.bucketname[count.index]
  tags   = var.tags
}

resource "aws_s3_bucket" "bucket2leel" {
  for_each = var.bucket_name_set
  bucket   = each.value
  tags     = var.tags

  depends_on = [aws_s3_bucket.bucket1leel]

}
