resource "aws_glue_job" "job_censo_new" {
  name         = "job_name"
  description  = "job-desc"
  role_arn = aws_iam_policy.glue_policy.arn
  max_capacity = 10
  max_retries  = 1
  timeout      = 60
  glue_version = "2.0"
  worker_type  = "G.1X"

  command {
    script_location = "s3://code/pyspark/glue_spark_job.py"
    python_version  = "3"
  }

  default_arguments = {    
    "--job-language"          = "python"
    "--ENV"                   = "env"
    "--spark-event-logs-path" = "s3://code/pyspark/"
    "--job-bookmark-option"   = "job-bookmark-enable"
    "--enable-spark-ui"       = "true"
  }

   execution_property {
    max_concurrent_runs = 1
  }
}