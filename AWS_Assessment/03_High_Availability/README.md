# Task 3: High Availability + Auto Scaling

## 1. Architecture Explanation
I enhanced the architecture to be Highly Available (HA) and scalable:
- **Application Load Balancer (ALB)**: Deployed in the public subnets. It acts as the single entry point for traffic, distributing requests across multiple healthy instances.
- **Private Instances**: The EC2 instances are now moved to **Private Subnets**. They have no public IPs and are not directly accessible from the internet, improving security.
- **Auto Scaling Group (ASG)**: Manages the lifecycle of instances. It ensures a minimum of 1 instance is running and can scale up to 3 based on demand (or manually set to 2 for this demo). It automatically replaces unhealthy instances.
- **Traffic Flow**: 
  1. User accesses ALB DNS name.
  2. ALB receives request on Port 80.
  3. ALB forwards request to a healthy instance in the Target Group (in Private Subnet).
  4. Instance processes request and responds via ALB.

## 2. Screenshots
> **Please insert your screenshots below after applying the Terraform code.**

### a) ALB Configuration
![ALB Screenshot](placeholder_alb.png)

### b) Target Group
![Target Group Screenshot](placeholder_tg.png)

### c) Auto Scaling Group
![ASG Screenshot](placeholder_asg.png)

### d) EC2 Instances (Launched via ASG)
![ASG Instances Screenshot](placeholder_asg_instances.png)

## 3. How to Run
1. Initialize Terraform: `terraform init`
2. Plan the deployment: `terraform plan`
3. Apply the changes: `terraform apply`
   - Enter `yes` when prompted.
4. **Verify**: Copy the `alb_dns_name` and paste it into your browser. Refresh multiple times to see if the hostname changes (indicating load balancing).
5. **Destroy**: `terraform destroy`
