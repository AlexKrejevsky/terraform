provider "aws" {
  region = "us-west-2"
}


resource "aws_instance" "servers" {
  count         = 4
  ami           = "ami-0e472933a1395e172"
  instance_type = "t2.micro"
  tags = {
    Name = "Server Number ${count.index + 1}"
  }
}
