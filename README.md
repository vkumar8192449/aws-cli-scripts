# ☁️ AWS CLI Scripts

A collection of shell scripts for setting up and managing AWS resources through the **AWS Command Line Interface (CLI)**. This repository includes essential scripts for installing and configuring the AWS CLI, as well as automating the creation of EC2 instances.

---

## 🚀 Scripts

### 1. Install AWS CLI (`install_awscli.sh`)

- Checks if the AWS CLI is already installed on your Linux machine.
- If AWS CLI is not installed, it downloads the latest version, extracts it, and installs it.
- Verifies the installation by checking the AWS CLI version.

#### **Script Execution:**

- This script first checks for an existing AWS CLI installation.
- If not found, it downloads `awscliv2.zip`, extracts it, and runs the installation.
- Provides feedback on whether the installation was successful or not.

---

### 2. Configure AWS CLI (`configure_awscli.sh`)

- Interactively prompts for:
  - **AWS Access Key ID**
  - **AWS Secret Access Key**
  - **Default region** (e.g., `us-east-1`)
  - **Preferred output format** (options include `json`, `yaml`, `text`, `table`)
  
- Sets these values using the `aws configure` command, enabling the AWS CLI to interact with your AWS account using the specified credentials and settings.
- Displays a message confirming successful configuration.

#### **Script Execution:**

- Run this script after installing AWS CLI to set up the necessary credentials and configuration for AWS operations.

---

### 3. Create EC2 Instance (`create_ec2_instance.sh`)

- Interactively prompts for:
  - **AMI ID** (with a default value of `ami-0dee22c13ea7a9a67`)
  - **Instance Type** (with a default value of `t2.micro`)
  - **Key name**
  - **Subnet ID**
  - **Security Group ID**
  - **Instance Name**
  
- Uses the provided information to create an EC2 instance using the AWS CLI.
- Waits for the instance to reach the "running" state before confirming the creation.
- Outputs the instance ID and status of the instance after creation.

#### **Script Execution:**

- Ensure AWS CLI is installed and configured before running this script.
- Run this script to create an EC2 instance with the specified configurations.

