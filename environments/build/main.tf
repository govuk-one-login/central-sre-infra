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

# module "main" {
#     source = "../../main"
#     product_id = "prod-uqstrdr2u5xoc"
#     product_version = var.product_version
#     system = var.system
#     environment = var.environment
# }


# module "deployment" {
#   source = "../../deployment"
# }