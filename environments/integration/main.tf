terraform {
  required_version = ">= 1.7.0"
  
  backend "s3" {
    bucket = "di-central-sre-integration-tfstate"
    key    = "central-sre-infra/integration.tfstate"
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
  allowed_account_ids = ["730335525541"]
  region              = "eu-west-2"
}

module "utilities" {
  source = "../../terraform/utilities"
  environment = local.environment
}

module "pipelines" {
    source = "../../terraform/pipelines"
    environment = "integration"
    include_promotion = "No"
    signing_profile_arn = "arn:aws:signer:eu-west-2:891376909120:/signing-profiles/SigningProfile_WOWPkr83gjpe"
    signing_profile_version_arn = "arn:aws:signer:eu-west-2:891376909120:/signing-profiles/SigningProfile_WOWPkr83gjpe/VYpUeFWxU1"
    artifact_source_bucket_arn = "arn:aws:s3:::centralised-logging-pipeli-artifactpromotionbucket-vffowgeuylal"
    artifact_source_bucket_event_trigger_role_arn = "arn:aws:iam::025394038831:role/PL-centralised-logging-pipeline-PromoTrigRole-0a895a65026f"
}