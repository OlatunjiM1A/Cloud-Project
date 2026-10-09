 Phase 1

 Automated AWS Infrastructure & Configuration

Instead of logging into the Amazon Web Services website and clicking 40 different buttons to buy and set up a virtual computer (server), I useD code to do it all. 

Terraform (The Builder): I told Terraform: "Build me a private digital fence (VPC), open a secure gateway to the internet, set up firewall rules (Security Group), and spin up a virtual computer (EC2 instance)." Terraform creates all of this on AWS automatically.

Ansible (The System Administrator): Once the virtual computer is running, Ansible logs in through a secure SSH key, updates the operating system, installs Docker, and starts the Docker service so the server is ready to run web apps.

[ Terraform Code ] ──────► Creates AWS Network & Virtual Server (EC2)
                                       │
                                       ▼ (Server Ready & Running)
[ Ansible Playbook ] ────► Logs in via SSH ──► Installs & Starts Docker


📁 Phase 1 Directory Structure

phase1-iac-ansible/
├── terraform/
│   ├── main.tf           # Creates VPC, Subnet, Internet Gateway, Security Group, & EC2
│   ├── variables.tf      # Defines input settings (AMI ID, instance type, region)
│   ├── outputs.tf        # Prints out the Server Public IP after creation
│   └── terraform.tfvars  # Your custom variable values (e.g., instance_type = "t2.micro")
├── ansible/
│   ├── ansible.cfg      # Ansible configuration & SSH settings
│   ├── inventory.ini    # Target host IP definition
│   └── playbook.yml     # Automated server setup and Docker deployment
├── screenshots/         # Project proof & verification images
├── .gitignore           # Ignores sensitive keys (.pem) and state files
└── README.md            # This guide


📋 What Gets Built on AWS?

Virtual Private Cloud (VPC): An isolated digital network in the cloud.

Public Subnet: A designated space inside the VPC with direct routing to the internet.

Internet Gateway & Route Table: Allows web traffic into and out of our subnet.

Security Group (Firewall):

Inbound Port 22 (SSH): Allows you and Ansible to connect securely.

Inbound Port 80 / 8080 (HTTP): Allows incoming public web traffic.

Outbound All Traffic: Allows the server to download software updates and packages.

EC2 Instance: A lightweight Ubuntu virtual machine (e.g., t2.micro / t3.micro).

 Prerequisites

AWS CLI installed and authenticated (aws configure using your Access Key and Secret).

Terraform (v1.5+) installed on your computer.

Ansible installed (macOS/Linux or WSL for Windows users).

An existing AWS Key Pair (.pem file) saved locally to allow SSH connections.

 Step-by-Step Deployment Guide

Step 1: Provision the Infrastructure with Terraform

Open your terminal and navigate to the Terraform folder:

cd phase1-iac-ansible/terraform


Initialize Terraform (downloads AWS provider plugins):

terraform init


Preview what will be created:

terraform plan


Create the infrastructure on AWS:

terraform apply -auto-approve


When complete, copy the Public IP Address printed in your terminal output (e.g., ec2_public_ip = "54.210.xx.xx").

Step 2: Configure the Server with Ansible

Navigate to the Ansible folder:

cd ../ansible


Open inventory.ini and update the IP address with the one output by Terraform:

[webserver]
 32.192.178.110 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/your-key.pem


Ensure proper file permissions on your private key:

chmod 400 ~/.ssh/your-key.pem


Test the connection between your computer and the new AWS server:

ansible webserver -m ping -i inventory.ini


(You should see "ping": "pong" and SUCCESS).

Run the configuration playbook:

ansible-playbook -i inventory.ini playbook.yml


🧪 Verification & Proof

Once the playbook completes, verify the results:

Check SSH & Docker manually:

ssh -i ~/.ssh/your-key.pem ubuntu@<100.58.186.203>
docker --version
sudo systemctl status docker


Screenshots Required for Submission:

AWS Management Console: Showing the EC2 instance in the Running state with its public IP.

Ansible Terminal Output: Showing all tasks green/yellow with failed=0.

Docker Status: Showing Docker is active (running) on the EC2 machine.

🧹 Teardown (Avoid AWS Costs)

When finished testing, remove all created resources:

cd ../terraform
terraform destroy -auto-approve


PS: Some processes where done the following day, therefore screenshot and the README would bring different types of IP as the previous inatance was destroyed.