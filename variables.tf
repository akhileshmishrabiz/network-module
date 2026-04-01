# vpc  cidr
variable "vpc_cidr" {
  type = string
  description = "codr for vpc "
}

# vpc_name
variable "vpc_name" {
  type = string
  description = "name for vpc "
}


# list = [ "asd", "fgh", "jkl"]
# map = { "key1" = "value1", "key2" = "value2" }
# object = { "key1" = "value1", "key2" = "value2" }
# subnet_data
# variable "subnet_data" {
#   type = list(object({
#     public              = bool
#     cidr              = string
#     availability_zone = string
#   }))
#   description = "List of subnets to create"
# } 

# variable "If_public_subnet" {
#     type = bool
#     description = "Whether to create public subnets"
#     default = true
# }

variable "private_subnet_data" {
    type = list(object({
    cidr              = string
    availability_zone = string
    prefix            = string
  }))
  description = "Map of subnets to create, categorized by type (public/private)"
}

variable "public_subnet_data" {
    type = list(object({
    cidr              = string
    availability_zone = string
    prefix            = string
  }))
  description = "Map of subnets to create, categorized by type (public/private)"
}