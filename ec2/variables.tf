variable "ami" {
  default = ""
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "default-key"
}

variable "user_data" {
    default = <<-EOF
    #!/bin/bash
    sudo apt update
    sudo apt install nginx -y
    sudo systemctl start nginx
    sudo systemctl enable nginx
    EOF
}