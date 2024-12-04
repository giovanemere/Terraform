##############
# IAM account
##############
module "iam_account" {
  source = "./modules/terraform-aws-iam/modules/iam-account"

  account_alias = "new-test-account-awesome-company"

  minimum_password_length = 6
  require_numbers         = false
}