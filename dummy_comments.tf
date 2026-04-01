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


# .tfvars -> used to declare the value of the variables declared in the .tf file

# vpc_cidr = "10.0.0.0/16"
# vpc_name = "my-vpc"
# private_subnet_data = [
#   {
#     cidr              = "10.0.1.0/24"
#     availability_zone = "ap-south-1a"
#     prefix            = "private"
#   }
#   , {
#     cidr              = "10.0.2.0/24"
#     availability_zone = "ap-south-1b"
#     prefix            = "private"
#   }

# ]

# public_subnet_data = [
#   {
#     cidr              = "10.0.3.0/24"
#     availability_zone = "ap-south-1a"
#     prefix            = "public"
#   }
#   , {
#     cidr              = "10.0.4.0/24"
#     availability_zone = "ap-south-1b"
#     prefix            = "public"
#   },

# ]

# list = [ "asd", "fgh", "jkl"]
# list =     0, 1, 2
# subnet_data[0].name -> public1
# subnet_data[1].name -> public2
# subnet_data[0].cidr ->   "10.0.1.0/24"
# subnet_data[1].cidr ->   ""10.0.2.0/24" 

# count means how many times to create the resource
# if count =2 -> first index 0, and then index 1

# If_public_subnet = true

# variable value
