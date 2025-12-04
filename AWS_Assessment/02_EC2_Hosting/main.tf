provider "aws" {
  region = "us-east-1"
}

variable "project_prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "FirstName_Lastname"
}

# Data source to get the default VPC
data "aws_vpc" "default" {
  default = true
}

# Data source to get a public subnet from the default VPC
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Security Group
resource "aws_security_group" "web_sg" {
  name        = "${var.project_prefix}_Web_SG"
  description = "Allow HTTP and SSH"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_prefix}_Web_SG"
  }
}

# EC2 Instance
resource "aws_instance" "web_server" {
  ami           = "ami-0c7217cdde317cfec" # Ubuntu 22.04 LTS in us-east-1 (Verify this ID or use data source)
  instance_type = "t2.micro"
  subnet_id     = tolist(data.aws_subnets.default.ids)[0]
  
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install nginx -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
              
              # Create a simple resume page
              echo "<html>
              <head><title>My Resume</title></head>
              <body>
              <h1>My Name - Resume</h1>
              <p>Welcome to my static resume hosted on AWS EC2 with Nginx!</p>
              </body>
              </html>" | sudo tee /var/www/html/index.html
              EOF

  tags = {
    Name = "${var.project_prefix}_Resume_Server"
  }
}

output "website_url" {
  value = "http://${aws_instance.web_server.public_ip}"
}
