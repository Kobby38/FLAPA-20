resource "aws_instance" "Test-server1" {
  ami           = "ami-05a8c865b4de3b127" # eu-west-2
  instance_type = "t2.micro"
  key_name = "Good-kp"
  vpc_security_group_ids =[aws_security_group.Test-sec-group.id]
  associate_public_ip_address = true
  subnet_id = aws_subnet.Test-public-sub1.id
}

resource "aws_instance" "Test-server2" {
  ami           = "ami-05a8c865b4de3b127" # eu-west-2
  instance_type = "t2.micro"
  key_name = "Good-kp"
  vpc_security_group_ids =[aws_security_group.Test-sec-group.id]
  associate_public_ip_address = true
  subnet_id = aws_subnet.Test-priv-sub1.id
}