resource "aws_security_group" "animals_albs_sg" {
  name        = "albs_sg"
  description = "Opens_the_HTTP_port"
  vpc_id      = aws_vpc.animals_vpc.id

  ingress = [
    {
      description      = "Opens the HTTP port"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
  egress = [{
    description      = "Egress"
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  }]
}

resource "aws_security_group" "animals_ecss_sg" {
  name        = "ecss_sg"
  description = "Opens_the_HTTP_HTTPS_MySQL_and_NFS_port"
  vpc_id      = aws_vpc.animals_vpc.id

  ingress = [
    {
      description      = "Opens the HTTP port"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "Opens the HTTPS port"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
  egress = [{
    description      = "Egress"
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  }]
}
