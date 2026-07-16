# 🗄️ TerraWeek Day 4 — State & Remote Backends (Native Locking)

**Date:** Wednesday, 15th July 2026

Terraform's **state** is the single most important concept for working on a **team**. Today you'll understand what state is, why it's sensitive, and how to store it **remotely and safely** — using the **modern S3 native state locking** (no DynamoDB needed anymore!). 🔐

---

## 🎯 Learning Goals

- Understand **what Terraform state is** and why it exists.
- Use the **`terraform state`** commands to inspect and manipulate state.
- Move from **local** to **remote** state with an **S3 backend**.
- Enable **S3 native state locking** with `use_lockfile` (the 2026 way).
- Safely **import** existing resources into state.

---

## 🆕 What Changed (Important!)

> The old TerraWeek taught **S3 + DynamoDB** for state locking.
> As of **Terraform 1.10** (experimental) and **1.11** (GA), the S3 backend supports **native locking** via a lock file in the bucket — using S3 conditional writes.
> **DynamoDB-based locking is now deprecated** and will be removed in a future release.
> ➡️ For all new work, use **`use_lockfile = true`** and skip DynamoDB entirely.

---

# Task 1 – Why State Matters

## 1. What is `terraform.tfstate`?

- A file that Terraform uses to track the infrastructure it manages.
- It acts as Terraform's source of truth for your resources.

---

## 2. What does it store?

- Resource IDs and metadata.
- Current infrastructure state.
- Outputs and dependencies.
- Configuration mappings between code and real resources.

---

## 3. Why should we never edit it manually?

- Manual changes can corrupt the state file.
- Terraform may create, modify, or destroy resources incorrectly.
- Always let Terraform manage the state.

---

## 4. Why should we never push it to GitHub?

- It may contain sensitive information.
- Exposes infrastructure details publicly.
- Increases security risks if stored in public repositories.

> **Best Practice:** Add `terraform.tfstate` to `.gitignore`.

---

## 5. What is State Drift?

- When the actual infrastructure differs from Terraform's state file.
- Usually happens when resources are changed manually outside Terraform.

**Example:** Deleting an EC2 instance from the AWS Console without updating Terraform.

---

## 6. Why is the state file sensitive?

- Can store resource identifiers and infrastructure metadata.
- May contain sensitive values such as IP addresses, outputs, or credentials (depending on configuration).
- Should be stored securely and access-controlled.

---

## 7. Local State vs Remote State

| Local State | Remote State |
|------------|------------|
| Stored on your machine | Stored in a shared backend (e.g., S3) |
| Suitable for learning and small projects | Recommended for teams and production |
| No built-in collaboration | Supports team collaboration |
| Higher risk of accidental loss | More secure and reliable |

---

### Key Takeaway

> Terraform State is what allows Terraform to understand, track, and safely manage your infrastructure. Protect it, never edit it manually, and use remote state for collaborative environments.

### Task 2: Explore Local State & `terraform state`
Start from **any** working config (reuse Day 3's, or the [`./backend_demo`](./backend_demo) here). After an `apply`, practice:
```bash
terraform state list                       # list all managed resources
terraform state show <resource_address>    # inspect one resource
terraform state mv <src> <dest>            # rename/move within state
terraform state rm <resource_address>      # stop managing (does NOT delete infra)
terraform show                             # human-readable state
```
Document what each command does and when you'd use it.