
# Creating EC2 instance and installing nginx
resource "aws_instance" "myec2" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [ aws_security_group.webserver-sg.id ]

  user_data = var.user_data

  tags = {
    "Name" = "webserver"
  }
}

# Below block will create Security groups with ports 22, 80 and 443
resource "aws_security_group" "webserver-sg" {
    name = "my-web-sg"
    description = "SG for Web server"

    ingress {
        from_port   = 22
        to_port     = 22
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
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    tags = {
        "Name" = "web-sg"
    }
  
}