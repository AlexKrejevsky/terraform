provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "web" {
  ami           = "ami-0577b787189839998"
  instance_type = "t2.micro"
  key_name      = "alex-california-test"
}
