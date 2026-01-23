variable "environment" {
  description = "Environment name"
  type        = string
}


variable "tags" {
  description = "Common resource tags"
  type        = map(string)


variable "subnet_id" {
  description = "Subnet ID where EC2 instance will be launched"
  type        = string
}


variable "sg_id" {
  type = string
  description = "Security Group ID where the web server will be deployed"
}

variable "key_name" {
  type        = string
  description = "EC2 key pair name"
}

variable "iam_instance_profile" {
  description = "IAM instance profile to attach to the EC2 instance"
  type        = string
}
