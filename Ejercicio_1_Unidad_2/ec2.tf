resource "aws_instance" "Server_Ejercicio" {
  ami                         = "ami-09b90e09742640522"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.Subnet_VPC_ejercicio.id
  key_name                    = "jbaricot"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.SG_Ejercicio.id]

  tags = {
    Name = "Server_Ejercicio"
  }

}