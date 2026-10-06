# AWS Infrastructure Provisioning & Configuration with Terraform and Ansible

## Project Overview
This project automates the provisioning of an AWS EC2 instance inside a custom VPC using Terraform, followed by remote server configuration and Docker installation using Ansible.

## Architecture & Tools
- **Cloud Provider:** AWS (EC2, VPC, Subnet, Route Table, Internet Gateway, Security Group)
- **Infrastructure as Code (IaC):** Terraform
- **Configuration Management:** Ansible
- **Container Runtime:** Docker

## Infrastructure Provisioning (Terraform)
1. Initialize Terraform:
   \`\`\`bash
   cd terraform
   terraform init
   \`\`\`
2. Plan and apply configuration:
   \`\`\`bash
   terraform apply -auto-approve
   \`\`\`

## Server Configuration (Ansible)
1. Configure host inventory in `ansible/inventory.ini`.
2. Execute the configuration playbook:
   \`\`\`bash
   cd ../ansible
   ansible-playbook -i inventory.ini playbook.yml
   \`\`\`

## Verification & Screenshots
### 1. EC2 Instance Running
![EC2 Running](screenshots/ec2_running.png)

### 2. Ansible Playbook Execution & Docker Verification
![Ansible Success](screenshots/ansible_success.png)