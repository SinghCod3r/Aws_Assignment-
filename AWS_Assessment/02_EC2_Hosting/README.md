# Task 2: EC2 Static Website Hosting

## 1. Setup Explanation
I deployed a single EC2 instance in a public subnet to host the static website.
- **Instance**: Used `t2.micro` (Free Tier eligible) with Ubuntu 22.04.
- **Web Server**: Installed Nginx via `user_data` script to automatically serve the content upon launch.
- **Content**: A simple HTML resume is generated and placed in `/var/www/html/index.html`.
- **Security**: Attached a Security Group allowing inbound traffic only on ports 80 (HTTP) and 22 (SSH).

## 2. Infrastructure Hardening
To ensure security best practices:
- **Least Privilege**: The Security Group only opens ports 80 and 22. All other ports are blocked.
- **SSH Access**: In a real production environment, I would restrict port 22 to my specific IP address (`My_IP/32`) instead of `0.0.0.0/0`.
- **Updates**: The `user_data` script runs `apt update` to ensure the latest package lists are used before installing Nginx.
- **No Root Login**: Ubuntu AMIs default to disabling root login via SSH; we use the `ubuntu` user with keys (if a key pair were attached).

## 3. Screenshots
> **Please insert your screenshots below after applying the Terraform code.**

### a) EC2 Instance
![EC2 Instance Screenshot](placeholder_ec2.png)

### b) Security Groups
![Security Group Screenshot](placeholder_sg.png)

### c) Website Accessible
![Website Screenshot](placeholder_website.png)

## 4. How to Run
1. Initialize Terraform: `terraform init`
2. Plan the deployment: `terraform plan`
3. Apply the changes: `terraform apply`
   - Enter `yes` when prompted.
4. **Access the website**: Copy the `website_url` from the output and paste it into your browser.
5. **Destroy resources**: `terraform destroy`
