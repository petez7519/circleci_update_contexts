output "rotated_context_names" {
  description = "Names of rotated CircleCI contexts created by the module"
  value       = module.context_rotation.rotated_context_names
}
