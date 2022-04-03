provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "tharwat-key" {
  key_name = "tharwat-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDCOKCNhBkMxrBcF14sYtio6wyi/XYNfZjr8/UScfXuc0LW8Fe/sSQ2l8mxTd0ZP6MKgY6ZdkcqVxCtyx/BxsR+57qmIkYLcon5t6RBltTTfNO1Fkio9j4b9/JhQRC0r52axdhPC4KsRGXvJaD3SoeWpIGgMnLtYsfg5iySM7mTeYgCCHWb+vUB3Hda+H3aizE/5acBQ4MEIvGr1lGdRPh1URKienFd9Qm5y+hkD/Nvi8D3KDVv8/N09rlsw6AXhtFKChfXL0PC+CccpC0bs5ZJEOtRI00iFW/jFtajCBOkHQeS3BQF2EHqwM8bO2Nm03UzJedtiOxo/2Tm2VcFyEY+lj3IrgMQJjLz2WRIfgjH90ci/ZL6EAjOIBl79SbrWNlcqALgSWyw6d/kBZtUZcjrFn5ayt+JZ8AKjSjf8VBEBfnmenmt7WIZ/T1/CDe4AejF7Di6UzPRNcY171ZIBsDralFZESNtnDQSsxt7KgrTQ51ybnMd9ilBXnawWVEqmVk= root@Master"
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
