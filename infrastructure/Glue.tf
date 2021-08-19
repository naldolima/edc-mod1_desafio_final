resource "aws_glue_job" "job-censo" {
  name     = "jobcenso"
  role_arn = aws_iam_role.jobcenso.arn

  command {
    script_location = "s3://code/pyspark/glue_spark_job.py"
  }
}