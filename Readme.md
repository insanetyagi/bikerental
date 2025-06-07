# 🚀 BikeRental PHP App - Manual DevOps Deployment on AWS

This project demonstrates how to deploy a Dockerized PHP + MySQL app on AWS using:

✅ EC2  
✅ ALB (Application Load Balancer)  
✅ ASG (Auto Scaling Group)  
✅ CloudWatch (Monitoring)

---

## Prerequisites

- AWS Account
- Basic AWS knowledge (EC2, ALB, ASG)
- Basic Linux knowledge
- Basic Docker knowledge
- GitHub account (repo contains the app + Dockerfile + docker-compose.yml)
- Optional: Docker Hub account

---

## Project Flow

### 1️⃣ Clone Repository

SSH into your EC2 instance:

```bash
git clone <your-repo-url>
cd bikerental

2️⃣ Install Docker & Docker Compose on EC2

sudo apt-get update
sudo apt-get install -y docker.io docker-compose
sudo systemctl enable docker
sudo systemctl start docker

3️⃣ Run the App on EC2

docker-compose up -d

Test app at:
http://<EC2-Public-IP>:8080


4️⃣ Setup ALB (Application Load Balancer)
Create ALB in AWS Console.

Add listener on port 80 → forward to Target Group.

Create Target Group → register EC2 instances running the app.

Test app at: 
            http://<ALB-DNS-Name>
            

5️⃣ Setup Auto Scaling Group (ASG)
Create Launch Template (use latest EC2 AMI and User Data if needed).

Create ASG → attach Launch Template → attach Target Group.

Set desired capacity (ex: 2 instances).

ASG manages EC2 instances automatically.


### 6️⃣ CloudWatch Monitoring

#### View Metrics

- Go to **AWS Console** → **CloudWatch** → **Metrics**.

##### EC2 Metrics

- CPUUtilization
- NetworkIn / NetworkOut
- DiskReadBytes / DiskWriteBytes

##### ALB Metrics

- RequestCount
- TargetResponseTime
- HealthyHostCount
- UnHealthyHostCount

##### ASG Metrics

- GroupDesiredCapacity
- GroupInServiceInstances
- GroupTotalInstances
