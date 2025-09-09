terraform {
  required_providers {
    circleci = {
      source  = "circleci-public/circleci"
      version = "~> 0.1.0"
    }
  }
}

# Provider will use CIRCLECI_TOKEN environment variable
#provider "circleci" {
  # Token is read from CIRCLECI_TOKEN environment variable
#}

resource "circleci_context" "rotated" {
  for_each        = toset(var.rotation_suffixes)
  organization_id = var.organization_id
  name            = "${var.context_prefix}-${each.key}"
}
