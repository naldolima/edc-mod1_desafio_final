resource "aws_s3_bucket_object" "job-spark" {
  bucket = aws_s3_bucket.dl.id
  key    = "code/pyspark/glue_spark_job.py"
  acl    = "private"
  source = "../etl/glue_spark_job.py"
  etag   = filemd5("../etl/glue_spark_job.py")
}

resource "aws_s3_bucket_object" "stage-zone" {
  bucket = aws_s3_bucket.dl.id
  key    = "stage-zone/"
  acl    = "private"
}