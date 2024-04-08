terraform {
  required_version = ">= 1.7.0"
  
  backend "s3" {
    bucket = "di-central-sre-staging-tfstate"
    key    = "central-sre-infra/staging.tfstate"
    region = "eu-west-2"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  allowed_account_ids = ["025394038831"]
  region              = "eu-west-2"
}

module "utilities" {
  source = "../../terraform/utilities"
  environment = var.environment
}

module "pipelines" {
    source = "../../terraform/pipelines"
    allowed_accounts = "730335525541,572704362959"
    environment = "staging"
    include_promotion = "Yes"
    signing_profile_arn = "arn:aws:signer:eu-west-2:891376909120:/signing-profiles/SigningProfile_WOWPkr83gjpe"
    signing_profile_version_arn = "arn:aws:signer:eu-west-2:891376909120:/signing-profiles/SigningProfile_WOWPkr83gjpe/VYpUeFWxU1"
    artifact_source_bucket_arn = "arn:aws:s3:::centralised-logging-pipeli-artifactpromotionbucket-onqq1idmpmqy"
    artifact_source_bucket_event_trigger_role_arn = "arn:aws:iam::891376909120:role/PL-centralised-logging-pipeline-PromoTrigRole-06b0771b5f2d"
}
