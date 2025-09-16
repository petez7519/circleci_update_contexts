# TF-Update-Contexts
Step-by-Step: Rotating test-context-for-rotation

✅ 1. Decide on Your New Context Name
Pick a suffix to version the context.

For example:
test-context-for-rotation-v2
test-context-for-rotation-2025-09
test-context-for-rotation-next

This keeps your naming consistent and traceable.

🛠️ 2. Update terraform.tfvars
Modify the context_prefix and rotation_suffixes like so:

hcl
context_prefix    = "test-context-for-rotation"
rotation_suffixes = ["v2"]  # or ["2025-09"], etc.
This tells Terraform to create a new context named test-context-for-rotation-v2.

📦 3. Apply the Change

Run:
bash
terraform plan
terraform apply
Terraform will create the new context. You can now inject secrets into it manually via the CircleCI UI or API.

🧹 4. (Optional) Remove the Old Context
If you want to decommission the original test-context-for-rotation, you have two options:

Option A: Remove from Terraform
If the original context was managed by Terraform, remove its suffix from rotation_suffixes and run:

bash
terraform apply
Option B: Destroy Manually
If it wasn’t managed by Terraform or you want to force removal:

bash
terraform destroy -target=module.context_rotation.circleci_context.rotated["original"]
Replace "original" with the suffix used for the old context (e.g., "v1" or "" if it had no suffix).

🔐 5. Reassign Jobs to the New Context
In your .circleci/config.yml, update any jobs or workflows that reference the old context:

yaml
context: test-context-for-rotation-v2
This ensures your builds use the rotated secrets and environment.

🧠 Pro Tip: Timestamped Rotation
For auditability, consider using date-based suffixes:

hcl
rotation_suffixes = ["2025-09"]
This gives you a clear history of when each context was created.
