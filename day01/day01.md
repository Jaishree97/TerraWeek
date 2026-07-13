# 🌱 TerraWeek Day 1 — Introduction to IaC & Terraform Basics

** Date:** 12 July 2026

## Learning Summary

- Learned the basics of **Infrastructure as Code (IaC)**.
- Understood how **Terraform** automates infrastructure.
- Installed and verified the latest Terraform.
- Learned the Terraform workflow: **Init → Plan → Apply → Destroy**.
- Created the first Terraform-managed resource locally.

---

### Task 1: Understand IaC & Terraform
## Day 1 Notes

### 🏗️ What is Infrastructure as Code (IaC)?

Infrastructure as Code (IaC) is the practice of managing infrastructure using **code instead of manual configuration**. It makes deployments **faster, consistent, repeatable, and less error-prone**.

### 🌍 What is Terraform?

Terraform is an **open-source Infrastructure as Code (IaC) tool** by HashiCorp that provisions and manages infrastructure using a **declarative** approach. It supports **multiple cloud providers** from a single workflow.

### ⚖️ Terraform vs Alternatives

| Tool | One-Line Comparison |
|------|----------------------|
| **Terraform** | Multi-cloud, declarative IaC with a large provider ecosystem. |
| **OpenTofu** | Open-source fork of Terraform with community-driven development. |
| **Pulumi** | Uses programming languages like Python, Go, and TypeScript instead of HCL. |
| **CloudFormation** | AWS-native IaC service limited to AWS resources. |
| **Ansible** | Primarily a configuration management and automation tool, not a full IaC provisioning tool. |

---.

### Task 2: Install Terraform (latest version)
- Install **Terraform ≥ 1.15** using the [official install guide](https://developer.hashicorp.com/terraform/install).
- Verify your install and **paste the output** in your notes:

```bash
terraform version
terraform -help
```
- Install the **HashiCorp Terraform** extension in VS Code for syntax highlighting and autocomplete.

### Task 3: Learn 6 Crucial Terraform Terminologies
Explain each of these **in your own words** with a one-line example:
1. **Provider** — a plugin that lets Terraform talk to a platform (AWS, Azure, Docker…).
2. **Resource** — a piece of infrastructure you want to create (an EC2 instance, an S3 bucket…).
3. **State** — Terraform's record of what it manages (the `terraform.tfstate` file).
4. **Plan** — a preview of the changes Terraform will make.
5. **HCL** — HashiCorp Configuration Language, the syntax you write Terraform in.
6. **Module** — a reusable, packaged group of Terraform configuration.
