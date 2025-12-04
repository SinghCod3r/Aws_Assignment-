# Task 1: Networking & Subnetting (AWS VPC Setup)

## 1. Design Explanation
I designed a standard 2-tier VPC architecture to ensure security and scalability.
- **VPC**: Serves as the isolated network container.
- **Public Subnets**: Hosted in two separate Availability Zones (AZs) for high availability. These contain the NAT Gateway and will host public-facing resources like Load Balancers or Bastion hosts. They have a direct route to the Internet Gateway.
- **Private Subnets**: Also across two AZs. These are for secure resources (like application servers or databases) that should not be directly accessible from the internet. They access the internet via the NAT Gateway for updates/patches.
- **IGW**: Provides internet access for public subnets.
- **NAT Gateway**: Allows instances in private subnets to initiate outbound traffic (e.g., for software updates) without accepting inbound connections.

## 2. CIDR Ranges
I chose a `/16` VPC CIDR to allow for a large number of IPs (65,536), which is standard for a production-grade VPC. For subnets, I used `/24` (256 IPs), which is sufficient for most application layers.

| Resource | CIDR Range | Rationale |
| :--- | :--- | :--- |
| **VPC** | `10.0.0.0/16` | Provides a large address space (65k+ IPs) for future growth. |
| **Public Subnet 1** | `10.0.1.0/24` | 256 IPs, distinct from other subnets. |
| **Public Subnet 2** | `10.0.2.0/24` | 256 IPs, distinct, for HA in a second AZ. |
| **Private Subnet 1** | `10.0.3.0/24` | 256 IPs, distinct, for secure workloads. |
| **Private Subnet 2** | `10.0.4.0/24` | 256 IPs, distinct, for HA in a second AZ. |

## 3. Screenshots
> **Please insert your screenshots below after applying the Terraform code.**

### a) VPC
![VPC Screenshot](placeholder_vpc.png)

### b) Subnets
![Subnets Screenshot](placeholder_subnets.png)

### c) Route Tables
![Route Tables Screenshot](placeholder_route_tables.png)

### d) NAT Gateway + IGW
![NAT IGW Screenshot](placeholder_nat_igw.png)

## 4. How to Run
1. Initialize Terraform: `terraform init`
2. Plan the deployment: `terraform plan`
3. Apply the changes: `terraform apply`
   - Enter `yes` when prompted.
4. **Don't forget to destroy resources after taking screenshots**: `terraform destroy`
