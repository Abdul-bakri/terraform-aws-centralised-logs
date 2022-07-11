data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "alb_logs_arn" {
  force_destroy = true
  bucket        = "alb-logs-${data.aws_region.current.name}-today-nigeria"
  acl           = "private"
  versioning {
    enabled = true
  }

}