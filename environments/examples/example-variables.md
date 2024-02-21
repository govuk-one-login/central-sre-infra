# Example variables

| Variable | Description | Example value |
| -------- | ----------- | ------------- |
| product_id | The id of the s3 logging bucket product being provisioned. | "prod-7kirvmejl7iiq" |
| artifact_version | The version of the s3 logging bucket product being provisioned. | "0.0.1" |
| object_lock_mode | The object lock mode for the s3 logging bucket. Can be either `COMPLIANCE` or `GOVERNANCE`. See https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lock.html | "COMPLIANCE" |
| log_retention_in_days | The number of days to retain logs. | 365 |
| deletion_policy | The deletion policy for the associated kms key and key alias. | "Retain" |
| update_replace_policy | The update/replace policy for the associated kms key and key alias. | "Retain" |
| product | A required tag that indicates the product associated with these resources. | "central-sre-infra-s3-logging-bucket" |
| system | A required tag that indicates the system associated with these resources. | "central-sre-infra" |
| environment | A required tag that indicates the environment these resources are deployed in. | "dev" |
| owner | A required tag that indicates the owner of these resources. | "central-sre" |
