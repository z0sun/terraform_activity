# Configure aws provider
provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-1" # Replace with your desired AWS region
  #profile = "Admin"
}

# Define the existing VPC by its ID
data "aws_vpc" "" {
  id = "" # Replace with your VPC ID
}

# Define the existing subnets by their IDs
data "aws_subnet" "" {
  id = "" # Replace with first subnet ID
}

data "aws_subnet" "" {
  id = "" # Replace with your second subnet ID
}

# Read the content of your Jenkins deploy script
data "template_file" "" {
  template = file("${path.module}/")
}

resource "aws_instance" "project4B" {
  ami                         = "" # Replace with your desired AMI ID
  instance_type               = "t2.medium"             # Change to your desired instance type
  vpc_security_group_ids      = [""]
  subnet_id                   = "s" # Use the ID of the second subnet
  key_name                    = ""        # Replace with your SSH key name
  user_data                   = data.template_file.jenkins_deploy_script.rendered
  associate_public_ip_address = true # Ensure a public IP is assigned
  tags = {
    "Name" : ""
  }
}

output "new_instance_ip" {
  value       = aws_instance.project4B.public_ip
  description = "The public IP of the newly created EC2 instance"
}
