terraform {
  required_version = ">=0.13.0"
}

provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
  access_key =  "AKIAJJNKYL2SBSWZQTSA"
  secret_key =  "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"
}

resource "aws_security_group" "bigbluebutton" {
  name        = var.bigbluebutton_security_group_name
  description = "Security group for bigbluebutton server"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 16384
    to_port     = 32768
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    terraform = true
  }
}

resource "aws_security_group" "scalelite" {
  name        = var.scalelite_security_group_name
  description = "Security group for scalelite server"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    terraform = true
  }
}
