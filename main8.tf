provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "tharwat-key" {
  key_name = "tharwat-key"
  public_key = "****"
}
resource "aws_security_group" "tharwat-SG" {
  name        = "tharwat-SG"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-02f843ff8f4d4278c"

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
    Name = "allow_tls"
  }
}
resource "aws_instance" "instancetask" {
  ami = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  tags = {
    "Name" = "terraformTharwaaaaaat"
  }
  key_name = aws_key_pair.tharwat-key.key_name
  vpc_security_group_ids=[aws_security_group.tharwat-SG.id]
}

 
resource "aws_s3_bucket" "tharwat-bucket" {
  bucket = "tharwat-bucket"

  tags = {
    Name        = "tharwat-bucket"
  }
}
