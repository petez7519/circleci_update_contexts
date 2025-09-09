variable "organization_id" {
  description = "CircleCI organization ID (UUID format)"
  type        = string
  sensitive   = true
}

variable "context_prefix" {
  description = "Prefix for rotated context names"
  type        = string
}

variable "rotation_suffixes" {
  description = "List of suffixes for rotated contexts"
  type        = list(string)
}
