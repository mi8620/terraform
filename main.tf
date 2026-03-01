# provider "aws" {
#     region = "eu-north-1"
# }

# resource "aws_instance" "my_ec2" {
#     ami = "ami-05fcfb9614772f051"
#     instance_type = "t3.micro"
#     tags = {
#         Name = "MyFirstTerraformEC2"
#     }
# }

# Variables
# provider "aws" {
#     region = var.aws_region
# }

# data "aws_ami" "amazon_linux" {
#     most_recent = true
#     owners = ["amazon"]

#     filter {
#         name = "name"
#         values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#     }
# }

# resource "aws_instance" "my_ec2" {
#     ami = data.aws_ami.amazon_linux.id
#     instance_type = var.instance_type

#     tags = {
#         Name = var.instance_name
#     }
# }

# Conditional Expressions & Locals
# provider "aws" {
#     region = var.aws_region
# }

# data "aws_ami" "amazon_linux" {
#     most_recent = true
#     owners = ["amazon"]

#     filter {
#         name = "name"
#         values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#     }
# }
# locals {
#   name_tag = var.instance_type == "t3.micro" ? "Micro Instance" : "Standard Instance"
# }


# resource "aws_instance" "my_ec2" {
#     ami = data.aws_ami.amazon_linux.id
#     instance_type = var.instance_type

#     tags = {
#         Name = local.name_tag
#     }
# }

# Depends On
# provider "aws" {
#     region = var.aws_region
# }

# data "aws_ami" "amazon_linux" {
#     most_recent = true
#     owners = ["amazon"]

#     filter {
#         name = "name"
#         values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#     }
# }

# resource "aws_s3_bucket" "my_bucket" {
#     bucket = var.bucket_name

#     tags = {
#         Name = "MyS3Bucket"
#     }
# }

# resource "aws_instance" "my_ec2" {
#     ami = data.aws_ami.amazon_linux.id
#     instance_type = var.instance_type

#     tags = {
#         Name = var.instance_name
#     }
#     depends_on = [
#         aws_s3_bucket.my_bucket
#     ]
# }

# Module
# provider "aws" {
#     region = "eu-north-1"
# }

# data "aws_ami" "amazon_linux" {
#     most_recent = true
#     owners = ["amazon"]

#     filter {
#         name = "name"
#         values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#     }
# }

# module "ec2_instance" {
#     source = "./ec2-module"
#     ami = data.aws_ami.amazon_linux.id
#     instance_type = "t3.micro"
#     name = "MyModuleEC2"
# }

# Workspaces

# provider "aws" {
#     region = var.aws_region
# }

# data "aws_ami" "amazon_linux" {
#     most_recent = true
#     owners = ["amazon"]

#     filter {
#         name = "name"
#         values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#     }
# }

# resource "aws_instance" "my_ec2" {
#     ami = data.aws_ami.amazon_linux.id
#     instance_type = var.instance_type

#     tags = {
#         Name = "EC2-${terraform.workspace}"
#         Environment = terraform.workspace
#     }
# }

# Terraform Registry Modules

# provider "aws" {
#     region = var.aws_region
# }

# module "vpc" {
#   source = "terraform-aws-modules/vpc/aws"

#   name = "my-vpc"
#   cidr = "10.0.0.0/16"

#   azs             = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
#   private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
#   public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

#   enable_nat_gateway = true
#   enable_vpn_gateway = true

#   tags = {
#     Terraform = "true"
#     Environment = "dev"
#   }
# }

# Remote State with S3 + Locking with DynamoDB

provider "aws" {
    region = var.aws_region
}

data "aws_ami" "amazon_linux" {
    most_recent = true
    owners = ["amazon"]

    filter {
        name = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
}

resource "aws_instance" "my_ec2" {
    ami = data.aws_ami.amazon_linux.id
    instance_type = var.instance_type

    tags = {
        Name = "AdrtaRemoteStateEC2"
    }
}