
variable "region_tp_terraform" {
  type    = string
  default = "us-east-1"
}

variable "profile_tp_terraform" {
  type    = string
  default = "default"
}

variable "key_tp_terraform" {
  type    = string
  default = "AWS-SSH"
}


variable "availability_zone" {
  type    = string
  default = "us-east-1a"
}

variable "docker_image_dogs" {
  type    = string
  default = "026763445027.dkr.ecr.us-east-1.amazonaws.com/dogs:latest"
}

variable "docker_image_cats" {
  type    = string
  default = "026763445027.dkr.ecr.us-east-1.amazonaws.com/cats:latest"
}
