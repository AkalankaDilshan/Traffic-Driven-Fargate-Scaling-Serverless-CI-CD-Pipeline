# Traffic-Driven Fargate Scaling & Serverless CI/CD Pipeline

![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)

## 🎯 Overview
This project addresses a major bottleneck in modern DevOps: the high cost of "always-on" development and testing environments. I have engineered a fully **Serverless CI/CD Pipeline** that automates the deployment of containerized applications to **AWS Fargate**, featuring a custom **"Scale-to-Zero"** mechanism.

While standard autoscaling relies on CPU or Memory metrics, this architecture uses **Traffic-Driven Scaling**. The environment exists only when it is actually being used, virtually eliminating costs during idle periods (nights, weekends, or between test cycles).

## 🚀 Key Features
* **Cost Optimization:** Achieves up to 70% cost reduction for ephemeral environments by eliminating idle compute time.
* **Event-Driven Architecture:** Leverages Lambda and Step Functions for intelligent, stateful resource management.
* **On-Demand Provisioning:** Allows for "Pull-Request-to-Provision" workflows, where infrastructure is born and dies based on developer activity.
* **Serverless Stack:** 100% managed services, reducing operational overhead and maintenance.



## 🛠️ Tech Stack
* **Compute:** AWS Fargate (ECS)
* **CI/CD:** AWS CodePipeline, AWS CodeBuild
* **Registry:** Amazon ECR
* **Serverless Logic:** AWS Lambda, AWS Step Functions
* **Monitoring:** Amazon CloudWatch, SNS
* **Networking:** Amazon VPC, Application Load Balancer (ALB)

## 📈 Performance & Cost Impact
By scaling to zero, the total cost of ownership (TCO) for a standard `t3.medium` equivalent Fargate task is reduced significantly.

| Environment State | Traditional Scaling (Min 1) | This Project (Scale-to-Zero) |
| :--- | :--- | :--- |
| **Active (8 hrs/day)** | $0.04/hr | $0.04/hr |
| **Idle (16 hrs/day)** | $0.04/hr | **$0.00/hr** |
| **Monthly Savings** | 0% | **~66% Cost Reduction** |

## 📖 Documentation
Detailed technical breakdowns can be found in the [Architecture.md](./Architecture.md) file.

## ⚖️ License
Distributed under the MIT License. See `LICENSE` for more information.
