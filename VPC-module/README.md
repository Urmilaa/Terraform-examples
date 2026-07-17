## 🏗️ Architecture

```text
                    AWS Cloud

               +----------------------+
               |     VPC              |
               |   10.0.0.0/16        |
               |                      |
               |  Internet Gateway    |
               |         │            |
               |         │            |
      +--------┴---------┴--------+
      |                           |
+------------+              +------------+
| Public AZ1 |              | Public AZ2 |
|10.0.1.0/24 |              |10.0.2.0/24 |
+------------+              +------------+
       │                           │
       └──────── NAT Gateway ──────┘
                    │
      +-------------┴--------------+
      |                            |
+-------------+             +-------------+
| Private AZ1 |             | Private AZ2 |
|10.0.101.0/24|             |10.0.102.0/24|
+-------------+             +-------------+
```

---

## 📁 Project Structure

```text
terraform-vpc-module/
│
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── vpc.tf
├── outputs.tf
└── README.md
```

---
