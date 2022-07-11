data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "elk-vpc" {
  cidr_block = "10.1.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

}

resource "aws_subnet" "elk-subnet" {
  vpc_id = aws_vpc.elk-vpc.id
  for_each = {
    "elk Subnet 1" = [ data.aws_availability_zones.available.names[0], "10.1.1.0/24" , true]
    "elk Subnet 2" = [ data.aws_availability_zones.available.names[1], "10.1.2.0/24" , true ]
  }

  availability_zone = each.value[0]
  cidr_block = each.value[1]
  map_public_ip_on_launch = each.value[2]
}