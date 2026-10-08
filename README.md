# Cloud-Project
# AWS Infrastructure Provisioning & Server Configuration with Terraform & Ansible

## Overview
This project demonstrates automated cloud infrastructure provisioning and configuration management using industry-standard DevOps tools. 

Using **Terraform**, a fully isolated Amazon Web Services (AWS) network environment and an EC2 compute instance are provisioned. Then, **Ansible** configures the remote Ubuntu server over SSH, installs **Docker**, starts the Docker daemon, and verifies the environment by deploying a test container.

---

## Architecture & Tech Stack
* **Cloud Platform:** Amazon Web Services (AWS)
  * **Networking:** Virtual Private Cloud (VPC), Public Subnet, Internet Gateway (IGW), Route Tables
  * **Security:** Security Group (Port 22 for SSH, Port 80 for HTTP)
  * **Compute:** EC2 Instance (Ubuntu 22.04 LTS, `t3.micro`)
* **Infrastructure as Code (IaC):** Terraform
* **Configuration Management:** Ansible
* **Container Engine:** Docker

---

## Repository Structure
```text
.
├── terraform/
│   ├── main.tf          # Core infrastructure resources (VPC, Subnet, SG, EC2)
│   ├── variables.tf     # Configurable variables (region, CIDR blocks, key name)
│   ├── outputs.tf       # Exported values (EC2 public IP)
│   └── terraform.tfvars # User-defined variable values
├── ansible/
│   ├── ansible.cfg      # Ansible configuration & SSH settings
│   ├── inventory.ini    # Target host IP definition
│   └── playbook.yml     # Automated server setup and Docker deployment
├── screenshots/         # Project proof & verification images
├── .gitignore           # Ignores sensitive keys (.pem) and state files
└── README.md
