terraform {
  required_version = ">= 1.3.0"
  
  backend "s3" {
    bucket = "di-central-sre-dev-tfstate"
    key    = "central-sre-infra/s3-logging-bucket.tfstate"
    region = "eu-west-2"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  allowed_account_ids = ["022831652856"]
  region              = "eu-west-2"
}

module "main" {
    source = "../../main"
    product_id = var.product_id
    artifact_version = var.artifact_version
    object_lock_mode = var.object_lock_mode
    log_retention_in_days = var.log_retention_in_days
    deletion_policy = var.deletion_policy
    update_replace_policy = var.update_replace_policy
    product = var.product
    system = var.system
    environment = var.environment
    owner = var.owner
}