
#TODO audit hooks are currently boken
#https://gds.slack.com/archives/C052VAJVALS/p1708522701313399
# module "lambda-audit-hook" {
#   source     = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/lambda-audit-hook"
#   stack_name = "lambda-audit-hook-pipeline"

#   tags_custom = {
#     Environment = var.environment
#     Product     = "GOV.UK"
#     System      = "Central SRE"
#   }
# }

# module "infra-audit-hook" {
#   source     = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/infra-audit-hook"
#   stack_name = "infra-audit-hook-pipeline"

#   tags_custom = {
#     Environment = var.environment
#     Product     = "GOV.UK"
#     System      = "Central SRE"
#   }
# }

# module "checkov-hook" {
#   source     = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/checkov-hook"
#   stack_name = "checkov-hook-pipeline"

#   tags_custom = {
#     Environment = var.environment
#     Product     = "GOV.UK"
#     System      = "Central SRE"
#   }
# }

# data "aws_caller_identity" "current" {}

# resource "aws_servicecatalog_provisioned_product" "s3_logging_bucket" {
#   name       = "${data.aws_caller_identity.current.account_id}-s3-server-access-logs"
#   product_id = var.product_id
#   provisioning_artifact_id  = var.product_version

#   provisioning_parameters {
#     key   = "S3BucketName"
#     value = "${data.aws_caller_identity.current.account_id}-s3-server-access-logs"
#   }
#   provisioning_parameters {
#     key   = "System"
#     value = "${var.system}"
#   }
#   provisioning_parameters {
#     key   = "Environment"
#     value = "${var.environment}"
#   }
# }

module "slack-notifications" {
  source     = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/slack-notifications"
  stack_name = "di-assets-notifications"
  parameters = {
    SlackChannelId   = "C06CPAHLKNJ"
    SlackWorkspaceId = "T8GT9416G"
  }

  tags_custom = {
    Environment = var.environment
    Product     = "GOV.UK"
    System      = "Central SRE"
  }
}

module "certificate-expiry" {
  source     = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/certificate-expiry"
  stack_name = "cert-expiry-pipeline"
  parameters = {
    DaysBeforeExpiry = 30
  }

  tags_custom = {
    Environment = var.environment
    Product     = "GOV.UK"
    System      = "Central SRE"
  }
}