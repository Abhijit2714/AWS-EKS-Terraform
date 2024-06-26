output "vpc_id" {
    value = aws_vpc.vpc.id 
}

output "subnet_id_private_1" {
  value = aws_subnet.subnet-private-1.id
}

output "subnet_id_private_2" {
  value = aws_subnet.subnet-private-2.id
}

output "subnet_id_public_2" {
  value = aws_subnet.public-2.id
}

output "subnet_id_public_1" {
  value = aws_subnet.public-1.id
}

output "internet_geteway_id" {
    value = aws_internet_gateway.gw.id
  
}

output "default_route_table_id" {
    value = aws_route_table.route_table.id
  
}

output "allocation_id_nat" {
  value = aws_eip.lb-1.allocation_id
}
output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gateway
  
}