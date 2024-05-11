resource "aws_security_group" "SG_Ejercicio" {
  name        = "SG_Ejercicio"
  description = "Allow SSH And HTTP"
  vpc_id      = aws_vpc.VPC-Ejercicio.id


  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    description = "Allow HTTP"
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
    description = "Allow Out"
  }

  tags = {
    Name = "SG_Ejercicio"
  }


}