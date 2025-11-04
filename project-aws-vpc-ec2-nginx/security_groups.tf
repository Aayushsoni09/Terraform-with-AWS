resource "aws_security_group" "nginx-sg" {
  vpc_id = aws_vpc.my-vpc.id
  ingress {
    from_port = 80 # Start port (HTTP)
    to_port = 80  # End port (HTTP)
    protocol = "tcp" # Protocol type
    cidr_blocks = ["0.0.0.0/0"] # Allow traffic from anywhere (public)
  }

  egress {
    from_port = 0 # Start port (0 means all ports)
    to_port = 0 # End port (0 means all ports)
    protocol = "-1" # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"] # Allow outgoing traffic to anywhere
  }

  tags = {
    Name="nginx-sg"
  }
}