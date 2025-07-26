GitGovern
Terraform-based Infrastructure-as-Code project to manage GitHub organizations. Automate creation and management of teams, members, repositories, and permissions with reproducible and version-controlled configuration.

Prerequisites
Terraform installed (v1.x recommended) — Terraform Install Guide

GitHub Personal Access Token with appropriate scopes (repo, admin:org) — GitHub PAT Guide

Git installed (optional, for cloning repo)

Setup Instructions
1. Clone the Repository
bash
git clone https://github.com/RamSidharth/GitGovern.git
cd GitGovern
2. Create .env File to Store Environment Variables
Create a file named .env in the root directory or just rename the .env.sample to .env, to hold your sensitive environment variables:

bash
# .env example

# GitHub Personal Access Token (with repo and org permissions)
GITHUB_TOKEN="your_github_personal_access_token"

# GitHub organization or owner name exactly as it appears on GitHub
GITHUB_OWNER="your_github_org_name_or_username"
3. Loading Environment Variables Before Running Terraform
Terraform uses these environment variables automatically if they are set in your shell.

3.a. On Linux/macOS (bash or zsh)
Load variables from .env file with:

bash
set -a          # auto-export all variables
source .env
set +a
Then run Terraform commands in the same terminal session.

3.b. On Windows PowerShell
PowerShell doesn't support set -a or source. Use the following script to load your .env file variables for the session:

powershell
Get-Content .env | ForEach-Object {
  if ($_ -match '^\s*([^=]+?)\s*=\s*(.+)$') {
    $name = $matches[1]
    $value = $matches[2].Trim('"')
    [System.Environment]::SetEnvironmentVariable($name, $value, "Process")
  }
}
Alternatively, you can manually set the variables:

powershell
$env:GITHUB_TOKEN="your_github_personal_access_token"
$env:GITHUB_OWNER="your_github_org_name_or_username"
3.c. On Windows Command Prompt (cmd.exe)
Set environment variables in the current session:

text
set GITHUB_TOKEN=your_github_personal_access_token
set GITHUB_OWNER=your_github_org_name_or_username
Then run Terraform commands in the same window.

4. Terraform Commands
Run these commands in your project root directory:

Initialize Terraform
bash
terraform init
Validate Terraform Configuration
bash
terraform validate
Preview Planned Changes
bash
terraform plan
Apply the Configuration (create/update resources)
bash
terraform apply
You will be prompted to confirm by typing yes.

Optionally skip confirmation (use with care):

bash
terraform apply -auto-approve
Destroy All Managed Resources (optional cleanup)
bash
terraform destroy
5. Workflow Notes
The .auto.tfvars files present (e.g., teams.auto.tfvars, repositories.auto.tfvars) are automatically loaded by Terraform and define your team and repository configurations.

Teams and their descriptions, members, and repository permissions are all managed declaratively.

Changing .tfvars files and re-running terraform apply updates your GitHub organization accordingly.

Make sure to update .env file if your GitHub token or owner changes.

6. Recommended Git Ignore
Make sure you have .env in .gitignore to avoid committing secrets:

text
# .gitignore
.env
.terraform/
*.tfstate
*.tfstate.backup
You can commit a .env.sample file with placeholder values to help collaborators:

bash
# .env.sample

GITHUB_TOKEN="your_token_here"
GITHUB_OWNER="your_org_here"
Troubleshooting
If teams or repositories fail to create, verify environment variables are loaded correctly.

Use terraform plan to check changes before applying.

If descriptions don’t appear, ensure the description attribute is provided in your teams.auto.tfvars and passed properly in main.tf.

For permissions errors, verify your GitHub token scopes.

Run terraform state list to see managed resources.

