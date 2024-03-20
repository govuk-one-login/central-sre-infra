variable "environment" {
  description = "The environment to be deployed into."
  type = string
  validation {
    condition = contains(["build", "dev", "staging", "integration", "production"], (var.environment))
    error_message = "environemnt should be one of `build`, `dev`, `staging`, `integration` or `production`"
  }
}

# variable "product_id" {
  
# }
# variable "product_version" {
#   type = string
# }
# variable "system" {}
# variable "environment" {}
