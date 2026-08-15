# vpc  cidr
variable "vpc_cidr" {
  type        = string
  description = "cidr for vpc "
}

# vpc_name
variable "vpc_name" {
  type        = string
  description = "name for vpc "
}

# Here we can have a validation block so that if any mismatch in public and private subnets then resources won't be created
# Also this is helpful when multi-nat's are created where public subnets must equal to privat subnets. It prevents invalid configuartions and avoids unused nat gateways and unnecessary AWS costs. 
variable "private_subnet_data" {
  type = list(object({
    cidr              = string
    availability_zone = string
    prefix            = string
  }))
  description = "Map of subnets to create, categorized by type (public/private)"

  validation {
    condition = (
      var.need_single_nat_gateway ||
      length(var.private_subnet_data) == length(var.public_subnet_data)
    )

    error_message = "When using multiple NAT Gateways, public and private subnet counts must be equal."
  }
}

variable "public_subnet_data" {
  type = list(object({
    cidr              = string
    availability_zone = string
    prefix            = string
  }))
  description = "Map of subnets to create, categorized by type (public/private)"
}

variable "need_nat_gateway" {
  type        = bool
  description = "if nat gateway is needed"
  default     = false
}

variable "need_single_nat_gateway" {
  type        = bool
  description = "if you need only 1 nat gatway"
  default     = false
}

variable "enable_dns_hostnames" {
  type = bool
  description = "Enable DNS hostnames in the VPC"
  default = false
}

variable "enable_dns_support" {
  type = bool
  default = true
}