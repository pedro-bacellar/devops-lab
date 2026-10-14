resource "aws_instance" "website_server" {
  ami                    = "ami-04ea4e8270c27626c"
  instance_type          = "t3.micro"
  key_name               = "site-prod-key"
  vpc_security_group_ids = [aws_security_group.website_sg.id]
  iam_instance_profile   = "ecr-ec2-role"
  user_data = file("user_data.sh")

  tags = {
    Name        = "website_server"
    Provisioned = "Terraform"
  }
}

resource "aws_security_group" "website_sg" {
  name   = "website-sg"
  vpc_id = "vpc-0c393a3810a3c174d"

  tags = {
    Name        = "website-sg"
    Provisioned = "Terraform"
    Cliente     = "Pedro"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.website_sg.id

  cidr_ipv4   = "45.182.145.132/32"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.website_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.website_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  ip_protocol = "tcp"
  to_port     = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.website_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = -1
}