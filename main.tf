terraform {
  required_version = ">= 1.3.0"

  required_providers {
    circleci = {
      source  = "CircleCI-Public/circleci"
      version = "~> 0.1.0"
    }
  }
}

module "context_rotation" {
  source             = "./modules/context-rotation"
  organization_id    = var.organization_id
  context_prefix     = var.context_prefix
  rotation_suffixes  = var.rotation_suffixes
}
