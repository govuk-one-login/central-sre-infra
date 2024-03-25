module "centralised-logging" {
  source     = "git@github.com:govuk-one-login/ipv-terraform-modules//secure-pipeline/deploy-pipeline"
  template_url = "https://template-storage-templatebucket-1upzyw6v9cs42.s3.eu-west-2.amazonaws.com/sam-deploy-pipeline/template.yaml"
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
    ArtifactSourceBucketArn    = var.artifact_source_bucket_arn
    ArtifactSourceBucketEventTriggerRoleArn = var.artifact_source_bucket_event_trigger_role_arn
  }

  tags_custom = {
    System = "Central SRE"
  }
}