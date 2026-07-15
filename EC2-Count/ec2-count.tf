# Ec2 instance

      resource "aws_instance" "my_instance"{

      count = 2
      key_name = aws_key_pair.my_key.key_name
      security_groups = [aws_security_group.my_security_group.name]
      instance_type = var.ec2_instance_type
      ami = var.ec2_ami_id #ubuntu
