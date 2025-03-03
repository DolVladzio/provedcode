# == Subnet ==============================
resource "aws_internet_gateway" "k8s_gw" {
	vpc_id = var.vpc_id

	tags = {
		Name = "${var.env}-gw"
	}
}
#----------------------------
resource "aws_subnet" "k8s_private-zone-1" {
	vpc_id = var.vpc_id
	cidr_block = var.k8s_private-zone-1
	availability_zone = var.zone-1

	tags = {
		Name = "${var.env}-private-${var.zone-1}"
		"kubernetes.io/role/internal-elb" = "1"
		"kubernetes.io/cluster/${var.cluster_name}" = "owned"
	}
}
#----------------------------
resource "aws_subnet" "k8s_private-zone-2" {
	vpc_id = var.vpc_id
	cidr_block = var.k8s_private-zone-2
	availability_zone = var.zone-2

	tags = {
		Name = "${var.env}-private-${var.zone-2}"
		"kubernetes.io/role/internal-elb" = "1"
		"kubernetes.io/cluster/${var.cluster_name}" = "owned"
	}
}
#----------------------------
resource "aws_subnet" "k8s_public-zone-1" {
	vpc_id = var.vpc_id
	cidr_block = var.k8s_public-zone-1
	availability_zone = var.zone-1
	map_public_ip_on_launch = true

	tags = {
		Name = "${var.env}-public-${var.zone-1}"
		"kubernetes.io/role/elb" = "1"
		"kubernetes.io/cluster/${var.cluster_name}" = "owned"
	}
}
#----------------------------
resource "aws_subnet" "k8s_public-zone-2" {
	vpc_id = var.vpc_id
	cidr_block = var.k8s_public-zone-2
	availability_zone = var.zone-2
	map_public_ip_on_launch = true

	tags = {
		Name = "${var.env}-public-${var.zone-2}"
		"kubernetes.io/role/elb" = "1"
		"kubernetes.io/cluster/${var.cluster_name}" = "owned"
	}
}
#----------------------------
resource "aws_eip" "k8s_nat" {
	domain = "vpc"

	tags = {
		Name = "${var.env}-nat"
	}
}
#----------------------------
resource "aws_nat_gateway" "k8s_nat_gateway" {
	allocation_id = aws_eip.k8s_nat.id
	subnet_id = aws_subnet.k8s_public-zone-1.id

	tags = {
		Name = "${var.env}-nat"
	}

	depends_on = [ aws_internet_gateway.k8s_gw ]
}
#----------------------------
resource "aws_route_table" "k8s_route_table-private" {
	vpc_id = var.vpc_id

	route {
		cidr_block = "0.0.0.0/0"
		nat_gateway_id = aws_nat_gateway.k8s_nat_gateway.id
	}

	tags = {
		Name = "${var.env}-private"
	}
}
#----------------------------
resource "aws_route_table" "k8s_route_table-public" {
	vpc_id = var.vpc_id

	route {
		cidr_block = "0.0.0.0/0"
		nat_gateway_id = aws_nat_gateway.k8s_nat_gateway.id
	}

	tags = {
		Name = "${var.env}-public"
	}
}
#----------------------------
resource "aws_route_table_association" "private_zone-1" {
	subnet_id = aws_subnet.k8s_private-zone-1.id
	route_table_id = aws_route_table.k8s_route_table-private.id
}
#----------------------------
resource "aws_route_table_association" "private_zone-2" {
	subnet_id = aws_subnet.k8s_private-zone-2.id
	route_table_id = aws_route_table.k8s_route_table-private.id
}
#----------------------------
resource "aws_route_table_association" "public_zone-1" {
	subnet_id = aws_subnet.k8s_public-zone-1.id
	route_table_id = aws_route_table.k8s_route_table-public.id
}
#----------------------------
resource "aws_route_table_association" "public_zone-2" {
	subnet_id = aws_subnet.k8s_public-zone-2.id
	route_table_id = aws_route_table.k8s_route_table-public.id
}
#----------------------------
