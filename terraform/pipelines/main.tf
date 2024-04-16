module "centralised-logging" {
  source     = "git@github.com:govuk-one-login/ipv-terraform-modules//secure-pipeline/deploy-pipeline"
  template_url = "https://template-storage-templatebucket-1upzyw6v9cs42.s3.eu-west-2.amazonaws.com/sam-deploy-pipeline/template.yaml"
  #template_url = "https://template-bucket-templatebucket-35qbug5k1irh.s3.eu-west-2.amazonaws.com/test-templates/sam-deploy-pipeline/f/SW-226-template.yaml"
  stack_name = "centralised-logging-pipeline"
  parameters = {
    SAMStackName               = "centralised-logging"
    VpcStackName               = "na"
    Environment                = var.environment
    IncludePromotion           = var.include_promotion
    AllowedAccounts            = var.allowed_accounts
    LogRetentionDays           = 30
    SigningProfileArn          = local.signing_profile_arn
    SigningProfileVersionArn   = local.signing_profile_version_arn
    OneLoginRepositoryName     = var.one_login_repository_name
    ArtifactSourceBucketArn    = var.centralised_logging_artifact_source_bucket_arn
    ArtifactSourceBucketEventTriggerRoleArn = var.centralised_logging_artifact_source_bucket_event_trigger_role_arn
  }

  tags_custom = {
    System = "Central SRE"
  }
}

module "devplatform-template-conformacne" {
  source     = "git@github.com:govuk-one-login/ipv-terraform-modules//secure-pipeline/deploy-pipeline"
  template_url = "https://template-storage-templatebucket-1upzyw6v9cs42.s3.eu-west-2.amazonaws.com/sam-deploy-pipeline/template.yaml"
  stack_name = "devplatform-conformance-pipeline"
  parameters = {
    SAMStackName               = "devplatform-conformance"
    VpcStackName               = "na"
    Environment                = var.environment
    IncludePromotion           = var.include_promotion
    AllowedAccounts            = var.allowed_accounts
    LogRetentionDays           = 30
    SigningProfileArn          = local.signing_profile_arn
    SigningProfileVersionArn   = local.signing_profile_version_arn
    OneLoginRepositoryName     = var.one_login_repository_name
    ArtifactSourceBucketArn    = var.conformance_artifact_source_bucket_arn
    ArtifactSourceBucketEventTriggerRoleArn = var.conformance_artifact_source_bucket_event_trigger_role_arn
  }

  tags_custom = {
    System = "Central SRE"
  }
}