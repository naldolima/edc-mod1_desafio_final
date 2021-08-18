variable "aws_region" {
  default = "us-east-2"
}

variable "lambda_function_name" {
  default = "Naldolima-executaEMR"
}

variable "key_pair_name" {
  default = "naldolima-key"
}

variable "airflow_subnet_id" {
  default = "subnet-4cef5427"
}

variable "vpc_id" {
  default = "vpc-d724b4bc"
}
