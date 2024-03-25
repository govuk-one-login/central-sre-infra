data "aws_cloudformation_stack" "aws_signer" {
  count = var.environment == "build" ? 1 : 0
  name = "aws-signer"
}
