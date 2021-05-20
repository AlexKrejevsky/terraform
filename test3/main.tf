provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0577b787189839998"
  instance_type = "t2.micro"
  key_name      = "alex-california-test"
  vpc_security_group_ids = [aws_security_group.web.id]
  user_data     = file("user-data.sh")

  tags = {
    Name = "WebServer built by Terraform"
    Owner = "Alex Krejevsky"
  }
}
resource "aws_security_group" "web" {
  name = "WebServerSG"

  /*resource "aws_security_group" "my_webserver" {
    name = "Dynamic Security Group"

    dynamic "ingress" {
      for_each = ["80", "443", "8080", "1541", "9092", "9093"]
      content {
        from_port   = ingress.value
        to_port     = ingress.value
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    }
  */

  ingress {
    description = "Allow HTTP"
    from_port = 80
    to_port =80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow HTTPS"
    from_port = 443
    to_port =443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "All ports"
    from_port =0
    to_port =0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]


  }
  tags = {
    Name = "WebServer SG by Terraform"
    Owner = "Alex Krejevsky"
  }
}
