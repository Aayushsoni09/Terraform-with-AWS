# Terraform-with-AWS
This repository will contains many projects of AWS built with terraform. I will update them as I learn and build projects.

# Terraform with AWS – Learning Repository

A comprehensive, hands-on repository for learning **Terraform with AWS** from the ground up.

This repo is designed for anyone getting started with **Infrastructure as Code (IaC)** using Terraform, and looking to build real cloud resources step‑by‑step.

---

## 🚀 What You'll Learn

* Provisioning EC2 instances
* Creating VPCs, Subnets, Route Tables & Internet Gateways
* Managing IAM Users, Roles & Policies
* Deploying S3 Buckets & Static Websites
* Data Sources & Outputs
* Terraform Variables, Functions, Operators
* Modular Infrastructure (Reusable Terraform Modules)
* Multi‑resource patterns & real‑world examples

---

## 📂 Repository Structure

Each folder demonstrates a specific Terraform concept or AWS resource.
Common directories you will find:

* `aws-ec2` → EC2 provisioning examples
* `aws-vpc` → Full VPC setup with networking components
* `aws-s3` → S3 bucket with versioning + static website hosting
* `project-static-website` → End‑to‑end web hosting project
* `project-aws-vpc-ec2-…` → VPC + EC2 real project
* `project-aws-iam-yaml` → IAM users & permissions
* `tf-module-vpc` → VPC module usage
* `tf-my-module` → Custom module examples
* `tf-functions` → Terraform function demonstrations
* `tf-multi-resources` → Deploying multiple infra components
* `tf-variables` → Variables & tfvars usage

> Browse each folder independently to experiment and learn.

---

## ✅ Prerequisites

* AWS Account
* Terraform installed locally
* IAM credentials configured (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`)
* Basic understanding of AWS services (helpful but optional)

---

## ▶ Getting Started

Clone the repo:

```bash
git clone <repo-url>
cd terraform
```

Initialize Terraform:

```bash
terraform init
```

Validate configuration:

```bash
terraform validate
```

Preview changes:

```bash
terraform plan
```

Apply:

```bash
terraform apply
```

Destroy when finished:

```bash
terraform destroy
```

---

## 📘 Concepts Covered

### Core Terraform Topics

* Providers
* Resources & Data Sources
* Files & Folder structure
* Input variables & outputs
* State management
* Meta arguments
* Provisioners

### AWS Resources

* EC2
* VPC Networking
* IAM
* S3
* Route tables
* Internet/NAT gateways

### Intermediate/Advanced

* Modules
* Functions
* Operators & Expressions
* Multi‑resource deployments
* Best practices

---

## 🌐 Sample Projects

✅ Static Website Hosting on S3
✅ EC2 deployment inside custom VPC
✅ IAM automation with YAML policies
✅ Full reusable VPC module

Each project folder contains self‑contained `.tf` configurations.

---

## 🧠 Why This Repo?

There are many Terraform examples on the internet, but very few structured step‑by‑step examples that:

* Start from basics → scale to real projects
* Use AWS hands‑on deployment
* Include modules, variables & project design

This repo solves that by helping you:
✅ Build confidence
✅ Understand cloud automation
✅ Reuse infra through modules

---

## ⭐ Contribute & Support

If you find this helpful:

* ⭐ Star the repo
* Share it with others
* Contribute examples or enhancements

---

## 📩 Contact

Feel free to connect — always happy to help & collaborate!

---

Happy Building ☁️⚙️

