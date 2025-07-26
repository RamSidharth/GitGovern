# GitGovern - Terraform-based GitHub Organization Management

## Overview
Terraform-based Infrastructure-as-Code project to manage GitHub organizations. Automate creation and management of teams, members, repositories, and permissions with reproducible and version-controlled configuration.

---

## Prerequisites
- Terraform installed (v1.x recommended) — see Terraform Install Guide
- GitHub Personal Access Token with scopes: `repo`, `admin:org` — see GitHub PAT Guide
- Git installed (optional, for cloning repo)

---

## Setup Instructions

### 1. Clone the Repository
git clone https://github.com/RamSidharth/GitGovern.git


### 2. Create `.env` File for Environment Variables
Create a file named `.env` in the root directory or rename `.env.sample` to `.env` with contents:

GITHUB_TOKEN="your_github_personal_access_token"          
GITHUB_OWNER="your_github_org_name_or_username"           


### 3. Loading Environment Variables Before Running Terraform

- **Linux/macOS (bash or zsh):**
  
  set -a 
  
  source .env
  
  set +a
  
  Run Terraform commands in the same terminal session.

- **Windows PowerShell:**

  Get-Content .env | ForEach-Object {
  
  if ($_ -match '^\s*([^=]+?)\s*=\s*(.+)$') {
  
  $name = $matches
  
  $value = $matches.Trim('"')
  
  [System.Environment]::SetEnvironmentVariable($name, $value, "Process")

  Or set manually:
  
  $env:GITHUB_TOKEN="your_github_personal_access_token"
  
  $env:GITHUB_OWNER="your_github_org_name_or_username"


- **Windows Command Prompt (cmd.exe):**

  set GITHUB_TOKEN=your_github_personal_access_token
  
  set GITHUB_OWNER=your_github_org_name_or_username

---

### 4. Terraform Commands (run in project root)

- Initialize Terraform:

  terraform init

- Validate configuration:

  terraform validate

- Preview planned changes:
  
  terraform plan

- Apply configuration (create/update resources):

  terraform apply

- Destroy all managed resources (optional cleanup):

  terraform destroy


---

### 5. Workflow Notes
- `.auto.tfvars` files (e.g., `teams.auto.tfvars`, `repositories.auto.tfvars`) are auto-loaded by Terraform defining teams, members, repositories, and permissions declaratively.
- Change `.tfvars` files and re-run `terraform apply` to update your GitHub organization.
- Update `.env` file if GitHub token or owner changes.

---

### 6. Recommended `.gitignore` Entries

.env

.terraform/

*.tfstate

*.tfstate.backup



