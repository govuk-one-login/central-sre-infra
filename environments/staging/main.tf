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
