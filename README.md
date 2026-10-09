<<<<<<< HEAD
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
=======
 IOTBTech-Guided-Projects

 Automated Cloud & DevOps Stack: End-to-End AWS Deployment

This repository showcases a full-lifecycle Cloud & DevOps pipeline. The write code that automatically sets up virtual servers on Amazon Web Services (AWS), packages a web application into an isolated software container, and wires up an automated pipeline that updates the live website automatically every time code is committed to GitHub.

 High-Level Architecture & Workflow

[ Developer Machine ]
        │  git push
        ▼
   [ GitHub Repo ] ───(Trigger)───► [ GitHub Actions CI/CD ]
                                            │
               ┌────────────────────────────┴───────────────────────────┐
               ▼                                                        ▼
     1. Build Docker Image                                    3. SSH into EC2 Server
               │                                                        │
               ▼                                                        ▼
     2. Push to Amazon ECR ───────────(Pull Image)───────────► 4. Run Docker Container
                                                                        │
                                                                        ▼
                                                             [ Application Live Online ]


 Project Roadmap (The Three Phases)

Phase

Title

Status

Core Objective

Key Tools Used

Phase 1

Infrastructure & Server Provisioning

**Completed**

Automatically construct an AWS virtual network (VPC, Subnet, Security Group), launch an EC2 virtual server, and auto-configure it with Docker.

Terraform, Ansible, AWS EC2/VPC

Phase 2

Application Containerization

*Upcoming*

Package the application and its dependencies into a reproducible Docker container image and store it safely in Amazon Elastic Container Registry (ECR).

Docker, Amazon ECR

Phase 3

Continuous Integration & Delivery (CI/CD)

*Upcoming*

Build an automated pipeline using GitHub Actions that tests, builds, and pushes new code updates straight to the live AWS server without manual intervention.

GitHub Actions, GitHub Secrets, SSH

📂 Current Repository Structure

.
├── phase-1-terraform-aws-infrastructure               # Phase 1: Infrastructure & Server Provisioning
│   ├── terraform/                  # Terraform configurations
│   │   ├── main.tf                 # VPC, Subnet, Security Group, EC2 declarations[cite: 3]
│   │   ├── variables.tf            # Parameterized inputs (region, instance type, AMI)[cite: 3]
│   │   ├── outputs.tf              # Server Public IP output
│   │   └── terraform.tfvars        # Assigned variables values
│   ├── ansible/                    # Ansible automation[cite: 3]
│   │   ├── playbook.yml            # System updates & automated Docker installation[cite: 3]
│   │   ├── ansible.cfg             # Providing a centralized configuration point to customize the behavior of Ansible.
│   │   └── inventory.ini           # Target server host configuration
│   └── README.md                   # Dedicated Phase 1 documentation
├── screenshots/                    # Project validation & verification evidence
│   └── evidence/                   # Phase 1 deliverables[cite: 3]
│       ├── ec2_running.png         # AWS Console EC2 running status[cite: 3]
│       └── ansible_success.png     # Ansible playbook execution log (failed=0)[cite: 3]
└── README.md                       # Root Project Overview (this document)


 Prerequisites

Before i runn or deploy any part of this project, I ensure to have:

An AWS Account with administrative or programmatic access.

AWS CLI installed and configured locally (aws configure).

Terraform (>= 1.5.x) installed.

Ansible (>= 2.14.x) installed (Linux/macOS or WSL on Windows).

Docker installed and running on your local machine.

A GitHub account.

🚀 How I ran the Project (Step-by-Step)

Step 1: I provision Infrastructure & Configure Server (Phase 1)

Detailed instructions can be found in phase1-iac-ansible/README.md.

# 1. Provision AWS network and EC2 server
cd phase1-iac-ansible/terraform
terraform init
terraform apply -auto-approve

# 2. Configure the server with Ansible
cd ../ansible
ansible-playbook -i inventory.ini playbook.yml


Step 2: Package and Push Application to ECR (Phase 2)
Coming next



Step 3: Set Up Automated CI/CD (Phase 3)

Up coming


📸 Proof of Execution & Screenshots

Evidence for each project phase is cataloged in the screenshots/ directory:

Phase 1 Verification:

screenshots/phase1/ec2_running.png — AWS Console showing EC2 instance in Running status.

screenshots/phase1/ansible_success.png — Ansible output showing failed=0 and Docker active.

Phase 2 Verification:

Next

Phase 3 Verification:

coming after next

🧹 Clean Up / Teardown

To avoid incurring ongoing AWS charges when I am done testing:

# Destroy cloud infrastructure
cd phase1-iac-ansible/terraform
terraform destroy -auto-approve



👤 Author & Acknowledgments

Fellow/Engineer: Mujeebah / https://github.com/OlatunjiM1A

Program: IOTBTECH Guided Project (Cloud & DevOps Stack)
>>>>>>> b6dd226 (docs: add comprehensive readmes and phase 1 structure)
