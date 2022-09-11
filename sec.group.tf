resource "aws_security_group" "Test-sec-group" {
  name        = "allow_HTTP"
  description = "Allow HTTP and SSH inbound traffic"
  vpc_id      = aws_vpc.Prod-rock-VPC.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }

ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
}

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
      }

  tags = {
    Name = "allow_HTTP_and_SSH"
  }
}