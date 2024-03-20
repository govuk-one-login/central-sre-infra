module "github-identity" {
  source     = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/github-identity-provider"
  stack_name = "github-identity-infra-build"
  parameters = {
    Environment = "build"
  }

  tags = {
    System = var.system
  }
}

module "aws-signer" {
  source     = "git@github.com:govuk-one-login/ipv-terraform-modules.git//secure-pipeline/aws-signer"
  stack_name = "aws-signer"
  parameters = {
    Environment = var.environment
    System      = var.system
  }

  tags_custom = {
    System = var.system
  }
}