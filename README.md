# Terraform

A collection of practical Terraform configurations and hands-on examples for learning Infrastructure as Code (IaC) and provisioning AWS infrastructure.

This repository contains reusable **Terraform HCL configurations**, example resource definitions, and installation documentation to help understand how infrastructure can be created and managed using code.

## What You'll Find Here

- **EC2 Instances** — Launch AWS EC2 instances using Terraform.
- **Security Groups** — Configure security groups and associate them with EC2 instances.
- **VPC** — Create and configure Virtual Private Clouds.
- **Variables** — Use Terraform variables to make configurations flexible and reusable.
- **Count** — Create multiple instances using a single resource block and `count.index`.
- **Terraform Setup** — Follow the installation guide to set up Terraform on your machine.

## Repository Structure

```text
Terraform/
├── Creating instance with new Security Group..tf
├── Terraform installation guide.md
├── count-example.tf
├── ec2_x86_launch.tf
├── vpc.tf
├── vpc_with_variables.tf
└── README.md
```


*This repository is intended for hands-on learning and experimentation with Terraform and AWS infrastructure provisioning.*
