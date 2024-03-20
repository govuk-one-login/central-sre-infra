terraform {
  required_version = ">= 1.7.0"
  
  backend "s3" {
    bucket = "di-central-sre-prod-tfstate"
    key    = "central-sre-infra/prod.tfstate"
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
  allowed_account_ids = ["572704362959"]
  region              = "eu-west-2"
}

module "utilities" {
  source = "../../terraform/utilities"
  environment = local.environemnt
}
