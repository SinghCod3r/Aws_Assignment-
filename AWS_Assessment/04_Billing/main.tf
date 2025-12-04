provider "aws" {
  region = "us-east-1"
}

variable "project_prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "FirstName_Lastname"
}

# CloudWatch Billing Alarm
resource "aws_cloudwatch_metric_alarm" "billing_alarm" {
  alarm_name          = "${var.project_prefix}_Billing_Alarm_100INR"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = "21600" # 6 hours
  statistic           = "Maximum"
  threshold           = "1.20" # Approx $1.20 USD ~= 100 INR
  alarm_description   = "Alarm when AWS charges exceed 100 INR"
  actions_enabled     = true

  dimensions = {
    Currency = "USD"
  }
  
  # Note: To send email notifications, you would need an SNS topic.
  # For this assessment, we are just creating the alarm resource.
}
