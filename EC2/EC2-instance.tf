resource "aws_instance" "my_instance" {

  ami           = "ami-0b6c6ebed2801a5cb"
  instance_type = "t3.micro"

  key_name = aws_key_pair.my_key.key_name

  security_groups = [
    aws_security_group.my_security_group.name
  ]

  root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }

  tags = {
    Name = "ec2-terraform"
  }
}
