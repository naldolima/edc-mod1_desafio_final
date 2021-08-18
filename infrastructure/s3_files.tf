resource "aws_s3_bucket_object" "job spark" {
  bucket = aws_s3_bucket.dl.id
  key    = "emr-code/pyspark/transform_parquet.py"
  acl    = "private"
  source = "../etl/transform_parquet.py"
  etag   = filemd5("../etl/tranform_parquet.py")
}

resource "aws_s3_bucket_object" "emr-log" {
  bucket = aws_s3_bucket.dl.id
  key    = "emr-log/"
  acl    = "private"
}

resource "aws_s3_bucket_object" "stage-zone" {
  bucket = aws_s3_bucket.dl.id
  key    = "stage-zone/"
  acl    = "private"
}