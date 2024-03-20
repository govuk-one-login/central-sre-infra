variable "environment" {
  description = "The environment to be deployed into."
  type = string
  default = "build"
  
  validation {
    condition = contains(["build", "dev", "staging", "integration", "production"], (var.environment))
    error_message = "environemnt should be one of `build`, `dev`, `staging`, `integration` or `production`"
  }
}