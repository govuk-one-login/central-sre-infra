terraform {
  required_version = ">= 1.7.0"
  
  backend "s3" {
    bucket = "di-central-sre-build-tfstate"
    key    = "central-sre-infra/build.tfstate"
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
  allowed_account_ids = ["891376909120"]
  region              = "eu-west-2"
}

module "build" {
  source = "../../terraform/build"
  environment = local.environment
}

module "utilities" {
  source = "../../terraform/utilities"
  environment = local.environment
}

module "pipelines" {
    source = "../../terraform/pipelines"
    allowed_accounts = "025394038831"
    environment = "build"
    include_promotion = "Yes"
    one_login_repository_name = "central-sre-infra"
}