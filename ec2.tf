resource "aws_instance" "MyFirstEc2instance_from_terraform" {
  ami = "ami-0759f51a90924c166"
  instance_type = "t2.micro"
  tags = {
    Name = "Ec2started_from_console_from_terraform"
  }
  key_name = "linux"
  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Hi Friend , I am $(hostname -f) hosted by terraform" > /var/www/html/index.html
                EOF
}