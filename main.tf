provider "aws"{
  region = "us-west-1"
}

resource "aws_instance" "my_amazon" {
  ami           = "ami-031b673f443c2172c"
  instance_type = "t2.micro"
  key_name      = "alex-california-test"

  tags = {
    Name = "My Amazon linux"
    Owner = "Alex"
    }
}
