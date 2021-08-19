resource "aws_glue_job" "job_censo_new" {
  name         = "job_name_new"
  description  = "job-desc"
  role_arn = aws_iam_policy.glue_role.arn
  glue_version = "2.0"
  worker_type  = "G.1X"
  number_of_workers = "4"

  command {
    script_location = "s3://datalake-naldolima-edc-tf/code/pyspark/glue_spark_job.py"
    python_version  = "3"
  }


   execution_property {
    max_concurrent_runs = 1
  }
}