resource "aws_instance" "ec2_1a" {
  ami                         = "ami-0599b6e53ca798bb2"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public-1a.id
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Hello from $(hostname)</h1>" > /var/www/html/index.html
  EOF

  tags = {
    Name = "terraform-ec2-1a"
  }
}

resource "aws_instance" "ec2_1c" {
  ami                         = "ami-0599b6e53ca798bb2"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public-1c.id
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Hello from $(hostname)</h1>" > /var/www/html/index.html
  EOF

  tags = {
    Name = "terraform-ec2-1c"
  }
}