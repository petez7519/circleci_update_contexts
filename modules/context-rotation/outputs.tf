output "rotated_context_names" {
  description = "Names of rotated CircleCI contexts"
  value       = [for ctx in circleci_context.rotated : ctx.name]
}
