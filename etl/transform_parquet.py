from pyspark.sql.functions import mean, max, min, col, count
from pyspark.sql import SparkSession

spark = (
    SparkSession.builder.appName("ExerciseSpark")
    .getOrCreate()
)

# Ler os dados do enem 2019
censo = (
    spark
    .read
    .format("csv")
    .option("header", True)
    .option("inferSchema", True)
    .option("delimiter", ";")
    .load("s3://datalake-naldolima-edc/raw-data/")
)


(
    censo
    .write
    .mode("overwrite")
    .format("parquet")
    .save("s3://datalake-naldolima-edc-tf/stage-zone/")
)
