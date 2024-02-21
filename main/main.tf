data "aws_caller_identity" "current" {}

resource "aws_servicecatalog_provisioned_product" "s3_logging_bucket" {
  name                       = "${data.aws_caller_identity.current.account_id}-s3-server-access-logs"
  product_id              = "${var.product_id}"
  provisioning_artifact_name = "${var.artifact_version}"

  provisioning_parameters {
    key   = "S3BucketName"
    value = "${data.aws_caller_identity.current.account_id}-s3-server-access-logs"
  }
  provisioning_parameters {
    key   = "Mode"
    value = "${var.object_lock_mode}"
  }
  provisioning_parameters {
    key   = "LogRetentionInDays"
    value = var.log_retention_in_days
  }
  provisioning_parameters {
    key   = "DeletionPolicy"
    value = "${var.deletion_policy}"
  }
  provisioning_parameters {
    key   = "UpdateReplacePolicy"
    value = "${var.update_replace_policy}"
  }
  provisioning_parameters {
    key   = "Product"
    value = "${var.product}"
  }
  provisioning_parameters {
    key   = "System"
    value = "${var.system}"
  }
  provisioning_parameters {
    key   = "Environment"
    value = "${var.environment}"
  }
  provisioning_parameters {
    key   = "Owner"
    value = "${var.owner}"
  }

}