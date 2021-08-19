resource "aws_glue_job" "job-censo" {
  name     = "job-censo"
  #role_arn = aws_iam_role.job-censo.arn

  command {
    script_location = "s3://code/pyspark/glue_spark_job.py"
  }
}