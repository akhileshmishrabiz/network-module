#  vpc
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

# CICD planning
# public ->  "10.0.1.0/24", "10.0.2.0/24"
# private -> "10.0.3.0/24", "10.0.4.0/24"
# rds ->  "10.0.5.0/24", "10.0.6.0/24"

# 2 public subnets

# resource "aws_subnet" "public" {
# count = length(var.subnet_data)
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = var.subnet_data[count.index].cidr
# #   map_public_ip_on_launch = var.If_public_subnet ? true : false
#     map_public_ip_on_launch = var.subnet_data[count.index].public ? true : false
#   # tiernary operator -> condition ? true : false
#   availability_zone       = var.subnet_data[count.index].availability_zone

#   tags = {
#     # Name = "${var.vpc_name}-${var.If_public_subnet ? "public" : "private"}${count.index + 1}"
#     Name = "${var.vpc_name}-${var.subnet_data[count.index].public ? "public" : "private"}${count.index + 1}"
#   }
# }


# ─── Public Subnets ───────────────────────────────────────────────────────────

resource "aws_subnet" "public" {
  count = length(var.public_subnet_data)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_data[count.index].cidr
  map_public_ip_on_launch = true
  availability_zone       = var.public_subnet_data[count.index].availability_zone

  tags = {
    Name = "${var.vpc_name}-${var.public_subnet_data[count.index].prefix}-${count.index + 1}"
  }
}


resource "aws_subnet" "private" {
  count = length(var.private_subnet_data)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_data[count.index].cidr
  map_public_ip_on_launch = false   
  availability_zone       = var.private_subnet_data[count.index].availability_zone

  tags = {
    Name = "${var.vpc_name}-${var.private_subnet_data[count.index].prefix}-${count.index + 1}"
  }
}
