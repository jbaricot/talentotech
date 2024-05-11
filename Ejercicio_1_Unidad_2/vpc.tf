resource "aws_vpc" "VPC-Ejercicio" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "VPC-Ejercicio"
  }

}

resource "aws_subnet" "Subnet_VPC_ejercicio" {
  vpc_id            = aws_vpc.VPC-Ejercicio.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-2b"

  tags = {
    Name = "Subnet_VPC_ejercicio"
  }

}

resource "aws_internet_gateway" "GW_Ejercicio" {
  vpc_id = aws_vpc.VPC-Ejercicio.id

  tags = {
    Name = "GW_Ejercicio"
  }

}

resource "aws_route_table" "Route_Ejercicio" {
  vpc_id = aws_vpc.VPC-Ejercicio.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.GW_Ejercicio.id

  }
  tags = {
    Name = "Route_Ejercicio"
  }
}
resource "aws_route_table_association" "a_rt_Ejercicio_subnet1" {
  route_table_id = aws_route_table.Route_Ejercicio.id
  subnet_id      = aws_subnet.Subnet_VPC_ejercicio.id

}

resource "aws_eip" "Elastic_IP" {
  instance   = aws_instance.Server_Ejercicio.id
  vpc        = true
  depends_on = [aws_internet_gateway.GW_Ejercicio]

  tags = {
    Name = "Elastic_IP"
  }

}