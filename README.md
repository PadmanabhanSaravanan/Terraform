# **Terraform**

![image terraform](image/terraform.png)

# **Table of Contents**

* [**Evolution of Cloud and Infrastructure as Code**](#evolution-of-cloud-and-infrastructure-as-code) <!-- style="font-size:20px" -->
* [**Terraform Overview & Set Up**](#terraform-overview-and-set-up) <!-- style="font-size:20px" -->
* [**Basic Terraform Usage**](#basic-terraform-usage) <!-- style="font-size:20px" -->
* [**Variables and Outputs**](#variables-and-outputs) <!-- style="font-size:20px" -->
* [**Additional HCL Features**](#additional-hcl-features) <!-- style="font-size:20px" -->
* [**Terraform Modules**](#terraform-modules) <!-- style="font-size:20px" -->
* [**Managing Multiple Environments**](#managing-multiple-environments) <!-- style="font-size:20px" -->
* [**Testing Terraform Code**](#testing-terraform-code) <!-- style="font-size:20px" -->
* [**Developer Workflows**](#developer-workflows) <!-- style="font-size:20px" -->

## **Evolution of Cloud and Infrastructure as Code** <!-- style="font-size:20px" -->

* [**Evolution of Cloud Infrastructure**](#evolution-of-cloud-infrastructure) <!-- style="font-size:20px" -->
* [**Infrastructure as Code Overview**](#infrastructure-as-code-overview) <!-- style="font-size:20px" -->

### **Evolution of Cloud Infrastructure**

In the early 90s and 2000s, tech companies building web applications had to go through a cumbersome process.

They needed to devise their idea, write the software, purchase servers, set up data centers, and handle all the power management, networking, and operational overhead. This process was challenging and time-consuming, often requiring significant capital expenses.

![image cloud](image/cloud.PNG) 

With the advent of cloud computing in the late 2000s and 2010s, the process changed drastically. After developing an idea and writing the software, companies could now deploy their applications to the cloud.

![image cloud](image/cloud1.PNG) 

**Key Advantages of Cloud Infrastructure:**

**Infrastructure available via APIs**: Rather than needing to purchase and set up infrastructure, API driven systems can spin up or spin down servers as needed within minutes. This on-demand resource model made infrastructure management faster and more efficient.

**Speed and Flexibility**: The ability to scale infrastructure up or down quickly in response to changing demands, like during high-traffic events such as Black Friday sales.

**Shift in Mindset**: Infrastructure is now viewed as short-lived and immutable, as opposed to the long-lived and mutable model of traditional data centers. This means that when changes or updates are needed, new servers with the required dependencies are provisioned, and old ones are torn down.

### **Infrastructure as Code Overview**

Three Main Approaches for Provisioning Cloud Resources:

**1. Cloud Console**: A graphical user interface provided by cloud providers, allowing users to interact with and manage cloud services.

**2. API or Command-Line Interface**: A method of interacting with cloud services programmatically, allowing for more efficient and automated management.

**3. Infrastructure as Code**: Defining your entire infrastructure within your codebase, offering better control, visibility, and consistency across environments.

**Categories of Infrastructure as Code Tools:** <!-- style="font-size:20px" -->

**1. Ad-hoc scripts**: Basic scripts that make API calls to provision infrastructure resources (e.g., shell scripts).

**2. Configuration management tools**: Tools like Ansible, Puppet, and Chef, designed to manage software and infrastructure configuration.

**3. Server templating tools**: Tools for building server templates, such as Amazon Machine Images (AMIs) or virtual machine images.

**4. Orchestration tools**: Tools like Kubernetes, which focus on deploying applications and managing containers.

**5. Provisioning tools**: Tools like Terraform, which focus on provisioning cloud resources using a declarative approach.

**Declarative vs. Imperative:** <!-- style="font-size:20px" -->

* Declarative tools define the desired end state of your infrastructure (e.g., five servers, one load balancer), and the tool handles the API calls and processes to achieve that state.
* Imperative tools require you to define the sequence of actions to create the desired infrastructure.

**Cloud-Specific vs. Cloud-Agnostic:** <!-- style="font-size:20px" -->

* **Cloud-specific tools**: These tools, such as AWS CloudFormation or Azure Resource Manager, are provided by major cloud providers and focus on provisioning infrastructure within their respective clouds.

* **Cloud-agnostic tools**: Tools like Terraform or Pulumi, which can be used across any cloud provider, allowing for greater flexibility when deploying resources across multiple clouds or when using third-party services.

![image cloud](image/cloud2.PNG) 

## **Terraform Overview and Set Up** 

* [**Terraform Overview**](#terraform-overview) <!-- style="font-size:20px" -->
* [**Setting up Terraform with AWS**](#setting-up-terraform-with-aws) <!-- style="font-size:20px" -->

### **Terraform Overview**

* [**What is Terraform**](#what-is-terraform) <!-- style="font-size:20px" -->
* [**Benefits of Terraform**](#benefits-of-terraform) <!-- style="font-size:20px" -->
* [**Terraform with Other Tools**](#terraform-with-other-tools) <!-- style="font-size:20px" -->
* [**Terraform Architecture**](#terraform-architecture) <!-- style="font-size:20px" -->

#### **What is Terraform**

* Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently
* Enables application software best practices to infrastructure
* Compatible with many clouds and services

![image Terraform](image/terraform1.png)

#### **Benefits of Terraform**

* Apply software development best practices to infrastructure management.
* Utilize version control to track infrastructure changes over time.
* Cloud-agnostic approach allows for compatibility with multiple cloud providers and services.
* Interact with almost any online service with an API.

#### **Terraform with Other Tools**

Terraform can be used in conjunction with other IaC tools to create powerful and flexible infrastructure management solutions. Some common patterns include:

**1.** Terraform + Configuration Management Tools (e.g., Ansible):

* Terraform provisions virtual machines
* Ansible installs and configures dependencies inside virtual machines.

**2.** Terraform + Templating Tools (e.g., Packer):

* I Terraform provisions servers.
* Packer builds the image from which virtual machines are created.

**3.** Terraform + Orchestration Tools (e.g., Kubernetes):

* Terraform provisions Kubernetes clusters.
* Kubernetes defines how the application is deployed and managed on the cloud resources.

#### **Terraform Architecture**

Terraform consists of two main components:

![image Terraform](image/tf-architecture.png)

**1. Terraform Core:**

* The engine that processes configuration files and manages the Terraform state file.
* Responsible for interacting with cloud provider APIs to make the current state match the desired configuration.

**2. Terraform Providers:**

* Plugins for Terraform Core that allow it to interact with specific cloud providers and services.
* Map configuration and state information to the appropriate API calls.
* Over 100 providers available for various cloud providers and services.

### **Setting up Terraform with AWS**

* [**Installing Terraform**](#installing-terraform)
* [**Authenticating with AWS**](#authenticating-with-aws)
* [**Creating a Basic Terraform Configuration**](#creating-a-basic-terraform-configuration)

#### **Installing Terraform**

Installing Terraform on Windows requires you to download the correct Terraform package, unpack, and execute it via the CLI. Follow the instructions below to ensure you do not miss any steps.

To install in Mac or linux system Refere to this [link](https://developer.hashicorp.com/terraform/downloads)

**Step1 : Download Terraform File for Windows**
`
1. Browse to the [Download Terraform](https://developer.hashicorp.com/terraform/downloads) page.

2. Select the Windows tab under the Operating System heading. The latest version is preselected.

![image Insatallation](image/install.PNG)

3. Choose the binary to download. Select 386 for 32-bit systems or AMD64 for 64-bit systems. Choose the download location for the zip file if the download does not start automatically.

4. Unzip the downloaded file. For example, use the C:\terraform path. Remember this location so you can add the path to the environment variables.

**Step2 : Add Terraform Path to System Environment Variables**

To add the Terraform executable to the system's global path:

1. Open the start menu, start typing environment and click Edit system environment variables. The System Properties window opens.  

2. Click the Environment Variables... button.

![image Insatallation](image/install1.PNG)

3. Select the Path variable in the System variables section to add terraform for all accounts. Alternatively, select Path in the User variables section to add terraform for the currently logged-in user only. Click Edit once you select a Path.

![image Insatallation](image/install2.PNG)

4. Click New in the edit window and enter the location of the Terraform folder.

![image Insatallation](image/install3.PNG)

5. Click OK on all windows to apply the changes.

**Step3 : Verify Windows Terraform Installation**

To check the Terraform global path configuration:

1. Open a new command-prompt window.

2. Enter the command to check the Terraform version: terraform -version

```markdown
terraform -version
```

![image Insatallation](image/install4.PNG)

The output shows the Terraform version you downloaded and installed on your Windows machine.

#### **Authenticating with AWS**

**Step1** : Create a user with the necessary IAM roles for your project. In this example, we used the following permissions:

* RDS access (AmazonRDSFullAccess)
* EC2 access (AmazonEC2FullAccess)
* IAM role management (IAMFullAccess)
* S3 access (AmazonS3FullAccess)
* DynamoDB access (AmazonDynamoDBFullAccess)
* Route 53 access (AmazonRoute53FullAccess)

![image Insatallation](image/install5.PNG)

![image Insatallation](image/install6.PNG)

**Step2** Install the AWS Command Line Interface (CLI) by following the instructions on the [AWS CLI installation page](https://aws.amazon.com/cli/).

if you facing the below error text click on the [link](image/install7.PNG)

```markdown
$ aws --version
command not found: aws
```

**Step3** Run aws configure and enter your access key ID, secret access key, and default region.

```markdown
aws configure
```

![image Insatallation](image/install8.PNG)

This will create a credentials file in your home directory at `~/.aws/credentials`.

#### **Creating a Basic Terraform Configuration**

**Step1.** Create a file named main.tf with the following content:

```markdown
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
  instance_type = "t2.micro"
}
```

**Step2.** This basic configuration specifies the AWS provider and an EC2 instance resource using an Ubuntu 20.04 AMI and the t2.micro instance type.

**Using Terraform Commands:**

* Initialize Terraform in the directory containing main.tf by running `terraform init`. This sets up the backend and state storage.

![image Insatallation](image/install9.PNG)

* Run `terraform plan` to view the changes Terraform will make to your infrastructure.

![image Insatallation](image/install10.PNG)

* Run `terraform apply` to create the specified resources. Confirm the action when prompted.

![image Insatallation](image/install11.PNG)

![image Insatallation](image/install12.PNG)

* To clean up resources and avoid unnecessary costs, run `terraform destroy` and confirm the action when prompted.

![image Insatallation](image/install13.png)

By following these steps, you have installed Terraform, authenticated with AWS, and created a basic configuration to provision a virtual machine on AWS!

## **Basic Terraform Usage** 

* [**Terraform Providers + Init**](#terraform-providers-+-init) <!-- style="font-size:20px" -->
* [**Terraform State Management**](#terraform-state-management) <!-- style="font-size:20px" -->
* [**Terraform Plan,Apply & Destroy**](#terraform-plan,apply-&-destroy) <!-- style="font-size:20px" -->
* [**Remote Backend Considerations**](#remote-backend-considerations) <!-- style="font-size:20px" -->
* [**Sample Application Walkthrough**](#sample-application-walkthrough) <!-- style="font-size:20px" -->

### **Terraform Providers + Init**

**The General Sequence of Terraform Commands:**

**1.** **terraform init**: Initializes your project

**2.** **terraform plan**: Checks your configuration against the current state and generates a plan

**3.** **terraform apply**: Applies the plan to create or update your infrastructure

**4.** **terraform destroy**: Removes resources when no longer needed

<br>

* [**Terraform Providers**](#terraform-providers)
* [**Terraform Init Command**](#terraform-init-command)

#### **Terraform Providers** 

A provider is a plugin that lets Terraform manage an external API

Provider plugins like the AWS provider or the cloud-init provider act as a translation layer that allows Terraform to communicate with many different cloud providers, databases, and services.

![images Terraform-provider](image/provider.png)

* Visit [registry.terraform.io](https://registry.terraform.io/) to explore available providers
* Official providers have the "official" tag and are maintained by the respective cloud service
* In your configuration file, specify required providers and pin their versions within a terraform block

Example:

```markdown
required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
```

#### **Terraform Init Command**

This command performs several different initialization steps in order to prepare the current working directory for use with Terraform

* In an empty working directory, create a "**main.tf**" file containing your configuration

* Run `terraform init` to download the necessary providers and store them in the  "**.terraform**" directory. The  "**.terraform.lock.hcl**" file contains information about the installed dependencies and providers

![image Insatallation](image/install9.PNG)

* Modules, reusable Terraform code bundles, are also downloaded and stored in the "**.terraform**" directory.

![images Terraform-init](image/init1.png)

### **Terraform State Management**

* The state file is a JSON file containing information about resources and data objects deployed using Terraform
* It includes metadata and other essential information about each resource
* The state file may contain sensitive information, so it must be protected and encrypted

The following is an example of a "**.tfstate**" file for a terraform config managing an s3 bucket:

```markdown
{
  "version": 4,
  "terraform_version": "1.0.0",
  "serial": 1,
  "lineage": "your-lineage-here",
  "outputs": {},
  "resources": [
    {
      "mode": "managed",
      "type": "aws_s3_bucket",
      "name": "example_bucket",
      "provider": "provider.aws",
      "instances": [
        {
          "attributes": {
            "acl": "private",
            "bucket": "example-bucket",
            "force_destroy": false,
            "id": "example_bucket",
            "region": "us-east-1",
            "tags": {}
          },
          "private": "bnVsbA=="
        }
      ]
    }
  ]
}
```

**Storing the State File:**

* [**Local Backend:**](#local-backend) The state file is stored within the working directory of the project
* [**Remote Backend:**](#remote-backend) The state file is stored in a remote object store or a managed service like Terraform Cloud

#### **Local Backend**

The local backend stores state on the local filesystem, locks that state using system APIs, and performs operations locally.

![image Local-Backend](image/localbackend.png)

**Advantages:**

* Easy to set up and use
* Stores the state file alongside your code

**Disadvantages:**

* Stores sensitive values in plain text
* Not suitable for collaboration
* Requires manual interaction for applying changes

#### **Remote Backend**

Terraform stores state about managed infrastructure to map real-world resources to the configuration, keep track of metadata, and improve performance. Terraform stores this state in a local file by default, but you can also use a Terraform remote backend to store state remotely.

![image Remote-Backend](image/remotebackend.png)

**Advantages:**

* Encrypts sensitive data
* Allows collaboration among multiple developers
* Supports automation through CI/CD pipelines

**Disadvantages:**

* Increased complexity compared to the local backend

**Remote Backend Options:**

* Terraform Cloud (managed offering)
* Self-managed remote backends (e.g., Amazon S3, Google Cloud Storage)

### **Terraform Plan,Apply & Destroy**

* [**Terraform Plan Command**](#terraform-apply-command)
* [**Terraform Apply Command**](#terraform-apply-command)
* [**Terraform Destroy Command**](#terraform-destroy-command)

#### **Terraform Plan Command**

* Compares the desired state (Terraform configuration) with the actual state (Terraform state file)
* Identifies any discrepancies between the two states
* Outputs the differences and the actions needed to reconcile the states

![image plan](image/plan.png)

#### **Terraform Apply Command**

* Executes the actions identified in the Terraform Plan command
* Creates, modifies, or deletes resources as needed to match the desired state
* Updates the Terraform state file to reflect the changes

![image apply](image/apply.png)

#### **Terraform Destroy Command**

* Removes all resources associated with the Terraform configuration
* Use with caution, as it permanently deletes resources
* Typically used to clean up resources at the end of a project or example

![image destroy](image/destroy.png)

### **Remote Backend Considerations**

* [**Terraform Cloud**](#terraform-cloud)
* [**Self-managed Backend (AWS S3)**](#self-managed-backend-aws-s3)
* [**Bootstrapping Process for AWS S3 Backend**](#bootstrapping-process-for-aws-s3-backend)

#### **Terraform Cloud**

* A managed offering from HashiCorp

Terraform Cloud runs Terraform operations and stores state remotely, so you can use Terraform without worrying about the stability of your local machine, or the security of your state file.

To use Terraform Cloud from the command line, you must log in. Logging in allows you to trigger remote plans and runs, migrate state to the cloud, and perform other remote operations on configurations with Terraform Cloud.

**Step1** Click the [link](https://app.terraform.io/) to create a account in Terraform Cloud.

**Step2** Configure terraform main.tf 

* Specify a backend type of "remote" with organization and workspace names in the Terraform configuration

```markdown
terraform {
  backend "remote"{
    organization = "organization-name"

    workspaces{
      name = "workspace-name"
    }
  }
}
```

**Step3** In order to authenticate with Terraform Cloud, run the `terraform login` subcommand. Respond yes to the prompt to confirm that you want to authenticate.

![image token](image/terraformlogin2.png)

**Step4** Generate a token

* A browser window will automatically open to the Terraform Cloud login screen. Enter a token name in the web UI, or leave the default name, terraform login

![image token](image/terraformlogin.png)

* Click Create API token to generate the authentication token.

![image token](image/terraformlogin1.png)

* Save a copy of the token in a secure location. It provides access to your Terraform Cloud organization. Terraform will also store your token locally at the file path specified in the command output.

**Step5** Add the token to the CLI

* When the Terraform CLI prompts you, paste the user token exactly once into your terminal. Terraform will hide the token for security when you paste it into your terminal. Press Enter to complete the authentication process.

![image token](image/terraformlogin3.png)

**Web UI allows you to interact with your account, organization, and workspaces**

![image token](image/terraform-cloud1.png)

Free up to five users within an organization, but costs $20 per user per month for more than five users

#### **Self-managed Backend AWS S3**

* Specify an S3 bucket and a DynamoDB table in the Terraform configuration
* S3 bucket stores the state file, while the DynamoDB table prevents multiple concurrent apply commands
* Requires a bootstrapping process to provision the S3 bucket and DynamoDB table

![image aws-s3](image/AWS-S3.PNG)

```markdown
terraform {
 backend "s3" {
    bucket         = "devops-directive-tf-state-bucket"
    key            = "aws-example/terraform.tfstate" #set as per you file structure
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }
}
```

#### **Bootstrapping Process for AWS S3 Backend**

* Create a Terraform configuration without a remote backend (defaults to a local backend)
* Define the necessary AWS resources: S3 bucket and DynamoDB table with a hash key named **"LockID"**
* Run `terraform apply` to create the S3 bucket and DynamoDB table
* Update the Terraform configuration to use the remote backend with the S3 bucket and DynamoDB table
* Re-run `terraform init` to import the state into the new remote backend

```markdown
terraform {
   backend "s3" {
     bucket         = "devops-directive-tf-state" # REPLACE WITH YOUR BUCKET NAME
     key            = "aws-example/terraform.tfstate" #set as per you file structure
     region         = "us-east-1"
     dynamodb_table = "terraform-state-locking"
     encrypt        = true
   }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket        = "devops-directive-tf-state" # REPLACE WITH YOUR BUCKET NAME
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "terraform_bucket_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_crypto_conf" {
  bucket        = aws_s3_bucket.terraform_state.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-state-locking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
```

### **Sample Application Walkthrough**

**Step1** : Set up your Terraform Backend
Choose between Terraform Cloud, AWS S3 + DynamoDB, or a local backend. For this example, we will use the AWS S3 backend with DynamoDB for state locking. See the previous lesson for info about setting this up.

**Step2** : Create a main.tf file and configure the backend definition:

The backend configuration goes within the top level terraform {} block.

```markdown
terraform {
  # Assumes s3 bucket and dynamo DB table already set up
  # See /code/03-basics/aws-backend
  backend "s3" {
    bucket         = "devops-directive-tf-state"
    key            = "03-basics/web-app/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
    profile        = "default"
  }
}
```

**Step3** : Configure the AWS provider:

You should specify the version as well as the AWS region you want the provider to operate in.

```markdown
terraform {
  ...

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}
```

**Step4** : Create EC2 Instances:

The following configuration defines two virtual machines with a basic python webserver that will be executed upon startup (by placing the commands within the user_data block).

We also need to define a security group so that we will be able to allow inbound traffic to the instances.

```markdown
resource "aws_instance" "instance_1" {
  ami             = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.instances.name]
  user_data       = <<-EOF
              #!/bin/bash
              echo "Hello, World 1" > index.html
              python3 -m http.server 8080 &
              EOF
}

resource "aws_instance" "instance_2" {
  ami             = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.instances.name]
  user_data       = <<-EOF
              #!/bin/bash
              echo "Hello, World 2" > index.html
              python3 -m http.server 8080 &
              EOF
}

resource "aws_security_group" "instances" {
  name = "instance-security-group"
}
```

**Step5** : Create an S3 Bucket:

We saw how to create an S3 bucket when bootstrapping the AWS backend. This configuration is similar.

```markdown
resource "aws_s3_bucket" "bucket" {
  bucket_prefix = "devops-directive-web-app-data"
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_crypto_conf" {
  bucket = aws_s3_bucket.bucket.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
```

**Step6** : Reference Default VPC and Subnet

To keep things simple, this configuration is deployed into a default VPC and Subnet.

Since these should already exist, we use the data object rather than the resource object so that terraform can retrieve information about them, but not manage them directly.

```markdown
data "aws_vpc" "default_vpc" {
  default = true
}

data "aws_subnet_ids" "default_subnet" {
  vpc_id = data.aws_vpc.default_vpc.id
}
```

**Step7** : Define Security Groups and Rules

Security groups are how we define what traffic is allowable. Here we specify that inbound traffic on port 8080 can be routed to our virtual machines.

```markdown
resource "aws_security_group_rule" "allow_http_inbound" {
  type              = "ingress"
  security_group_id = aws_security_group.instances.id

  from_port   = 8080
  to_port     = 8080
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
```

**Step8** : Set Up Load Balancer
We have two virtual machines and want to split traffic between them. We can do this with a load balancer. We configure the load balancer behavior and attach the two EC2 instances to it.

```markdown
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port = 80
  protocol = "HTTP"
  # By default, return a simple 404 page
  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "404: page not found"
      status_code  = 404
    }
  }
}

resource "aws_lb_target_group" "instances" {
  name     = "example-target-group"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default_vpc.id
  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_target_group_attachment" "instance_1" {
  target_group_arn = aws_lb_target_group.instances.arn
  target_id        = aws_instance.instance_1.id
  port             = 8080
}

resource "aws_lb_target_group_attachment" "instance_2" {
  target_group_arn = aws_lb_target_group.instances.arn
  target_id        = aws_instance.instance_2.id
  port             = 8080
}

resource "aws_lb_listener_rule" "instances" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 100
  condition {
    path_pattern {
      values = ["*"]
    }
  }
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.instances.arn
  }
}

resource "aws_security_group" "alb" {
  name = "alb-security-group"
}

resource "aws_security_group_rule" "allow_alb_http_inbound" {
  type              = "ingress"
  security_group_id = aws_security_group.alb.id
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_alb_all_outbound" {
  type              = "egress"
  security_group_id = aws_security_group.alb.id
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

}

resource "aws_lb" "load_balancer" {
  name               = "web-app-lb"
  load_balancer_type = "application"
  subnets            = data.aws_subnet_ids.default_subnet.ids
  security_groups    = [aws_security_group.alb.id]
}
```

**Step9** : Configure Route 53 for DNS
Rather than access the application with the auto-generated domain of the load balancer, instead we define a Route 53 DNS record to use a domain of our choosing.

```markdown
resource "aws_route53_zone" "primary" {
  name = "devopsdeployed.com"
}

resource "aws_route53_record" "root" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "devopsdeployed.com"
  type    = "A"
  alias {
    name                   = aws_lb.load_balancer.dns_name
    zone_id                = aws_lb.load_balancer.zone_id
    evaluate_target_health = true
  }
}
```

You will also need to update your domain's nameservers to use the AWS nameservers.

**Step10** : Create an RDS Instance

Our application does not actually use the RDS instance, but we provision one to demonstrate how because most web applications will need a database of some kind.

```markdown
resource "aws_db_instance" "db_instance" {
  allocated_storage = 20
  # This allows any minor version within the major engine_version
  # defined below, but will also result in allowing AWS to auto
  # upgrade the minor version of your DB. This may be too risky
  # in a real production environment.
  auto_minor_version_upgrade = true
  storage_type               = "standard"
  engine                     = "postgres"
  engine_version             = "12"
  instance_class             = "db.t2.micro"
  name                       = "mydb"
  username                   = "foo"
  password                   = "foobarbaz"
  skip_final_snapshot        = true
}
```

**Step11** : Initialize, Plan, and Apply the Configuration

* Run **"terraform init"** to initialize the remote backend.
* Run **"terraform plan"** to review the changes.
* Run **"terraform apply"** to apply the changes and provision the resources.

**Step12** : Test the Web Application

Access the load balancer's DNS name or your domain to check if the instances are working and load balancing is functioning properly.

**Step13** : Destroy the Resources

Run **terraform destroy** to clean up the resources and avoid incurring additional costs.

## **Variables and Outputs**

* [**Variables and Outputs (Theory)**](#variables-and-outputs-theory) <!-- style="font-size:20px" -->
* [**Variables and Outputs (Applied)**](#variables-and-outputs-applied) <!-- style="font-size:20px" -->

### **Variables and Outputs Theory**

### **Variables and Outputs Applied**

## **Additional HCL Features**

## **Terraform Modules**

* [**Terraform Modules (Theory)**](#terraform-modules-theory) <!-- style="font-size:20px" -->
* [**Terraform Modules (Applied)**](#terraform-modules-applied) <!-- style="font-size:20px" -->

### **Terraform Modules Theory**

### **Terraform Modules Applied**

## **Managing Multiple Environments**

* [**Managing TF Environments**](#managing-tf-environments) <!-- style="font-size:20px" -->
* [**Using Terraform Workspaces**](#using-terraform-workspaces) <!-- style="font-size:20px" -->
* [**Using Subdirectory Environments**](#using-subdirectory-environments) <!-- style="font-size:20px" -->

### **Managing TF Environments**

### **Using Terraform Workspaces**

### **Using Subdirectory Environments**

## **Testing Terraform Code**

* [**Testing Terraform Code (Theory)**](#testing-terraform-code-theory) <!-- style="font-size:20px" -->
* [**Testing Terraform Code (Practice)**](#testing-terraform-code-practice) <!-- style="font-size:20px" -->

### **Testing Terraform Code Theory**

### **Testing Terraform Code Practice**

## **Developer Workflows**

* [**Developer Workflows**](#developer-workflows) <!-- style="font-size:20px" -->
* [**GitHub Actions Automation**](#github-actions-automation) <!-- style="font-size:20px" -->

### **Developer Workflows**

### **GitHub Actions Automation**