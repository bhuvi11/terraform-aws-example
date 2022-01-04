locals {
  resource_name_prefix = var.account_alias == "" ? "${var.org_name}-bc" : "${var.org_name}-${var.account_alias}"
  role_name            = var.role_name != "" ? var.role_name : "${local.resource_name_prefix}-read-bridgecrewcwssarole"
  profile_str          = var.aws_profile != null ? "--profile ${var.aws_profile}" : ""
}
