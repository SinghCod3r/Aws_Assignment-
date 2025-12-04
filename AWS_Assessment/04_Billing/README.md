# Task 4: Billing & Free Tier Cost Monitoring

## 1. Explanation

### a) Why cost monitoring is important for beginners
Cost monitoring is critical because AWS operates on a "pay-as-you-go" model. Beginners often forget to terminate resources (like EC2 instances, NAT Gateways, or unattached EBS volumes) after experiments. Without monitoring, these "zombie" resources can accrue significant charges over time, leading to "bill shock" at the end of the month.

### b) What causes sudden increases in AWS bills
- **Leaving Resources Running**: Forgetting to stop/terminate high-cost resources like large EC2 instances or RDS databases.
- **NAT Gateways**: These charge per hour plus data processing fees. Leaving one running in a lab environment is a common mistake.
- **Data Transfer**: Excessive outbound data transfer (e.g., a public S3 bucket getting downloaded frequently).
- **Compromised Credentials**: If access keys are leaked (e.g., on GitHub), attackers can spin up expensive resources (like GPU instances for mining) within minutes.

## 2. Screenshots
> **Please insert your screenshots below.**

### a) Billing Alarm
![Billing Alarm Screenshot](placeholder_billing_alarm.png)

### b) Free Tier Usage Alerts page
*Go to Billing Dashboard -> Billing Preferences -> Receive Free Tier Usage Alerts*
![Free Tier Alerts Screenshot](placeholder_freetier_alerts.png)

## 3. How to Run
1. Initialize Terraform: `terraform init`
2. Apply the changes: `terraform apply`
3. **Note**: The alarm is set for > $1.20 USD (approx ₹100).
