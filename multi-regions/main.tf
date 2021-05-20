provider "aws" {
  region = "us-west-1"
}

provider "aws" {
  region = "eu-south-1"
  alias  = "EUROPE"
}

provider "aws" {
  region = "ap-northeast-1"
  alias  = "ASIA"
}

#------------------------

resource "aws_instance" "my_default_server" {
  instance_type = "t2.micro"
  ami           = data.aws_ami.defaut_latest_ubuntu20.id
  tags = {
    Name = "Default Server"
  }
}

resource "aws_instance" "my_europe_server" {
  provider      = aws.EUROPE
  instance_type = "t2.micro"
  ami           = data.aws_ami.europe_latest_ubuntu20.id
  tags = {
    Name = "Europe Server"
  }
}

resource "aws_instance" "my_asia_server" {
  provider      = aws.ASIA
  instance_type = "t2.micro"
  ami           = data.aws_ami.asia_latest_ubuntu20.id
  tags = {
    Name = "Asia Server"
  }
}
