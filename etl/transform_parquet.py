from pyspark.sql import SparkSession
from pyspark.sql.functions import col, min, max

# Cria objeto da Spark Session
spark = (SparkSession.builder.appName("Spark-Desafio-Mod1")
    .getOrCreate()
)

# Leitura de dados
enem = (
    spark.read.format("csv")
    .option("inferSchema", True)
    .option("header", True)
    .option("delimiter", ";")
    .load("s3://datalake-naldolima-edc/raw-data")
)

# Escreve a tabela em staging em formato parquet
print("Writing parquet table...")
(
    enem
    .write
    .mode("overwrite")
    .format("parquet")
    .partitionBy("year")
    .save("s3://datalake-naldolima-edc-tf/stage-zone/censo")
)
