variable "environment" {
  type = string
  description = "The deployment environment."
}

variable "include_promotion" {
  type = string
  description = "Will this environment promote."
}

variable "allowed_accounts" {
  type = string
  description = "Comma seperated list of accounts that can read from the artefact bucket"
  default=null
}

variable "signing_profile_arn" {
  type = string
  description = "The arn of the signing profile."
  default = null
}

variable "signing_profile_version_arn" {
  type = string
  description = "The arn of the signing profile version."
  default = null
}

variable "one_login_repository_name" {  
  type = string
  description = "The One Login github repo where the workflow is triggered from."
  default = null
}

variable "artifact_source_bucket_arn" {
  type = string
  description = "The arn of the source s3 bucket that "
  default = null
}
variable "artifact_source_bucket_event_trigger_role_arn" {default = null}