resource "aws_glue_job" "job_censo_new" {
  name         = "job_name_new"
  description  = "job-desc"
  role_arn = aws_iam_policy.glue_policy.arn

  command {
    script_location = "s3://datalake-naldolima-edc-tf/code/pyspark/glue_spark_job.py"
    python_version  = "3"
  }

  default_arguments = {    
    "--job-language"          = "python"
    "--ENV"                   = "env"
    "--spark-event-logs-path" = "s3://datalake-naldolima-edc-tf/code/pyspark/"
    "--job-bookmark-option"   = "job-bookmark-enable"
    "--enable-spark-ui"       = "true"
  }

   execution_property {
    max_concurrent_runs = 1
  }
}