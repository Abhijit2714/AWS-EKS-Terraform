variable "cidr_block_vpc" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block for the VPC."
}

variable "cidr-block-subnet-private-1" {
  type        = string
  default     = "10.0.1.0/24"
  description = "CIDR block for the first private subnet."
}

variable "az-subnet-private-1" {
  type        = string
  default     = "us-east-1a"
  description = "Availability Zone for the first private subnet."
}

variable "public-ip-on-launch-subnet-private-1" {
  type        = bool
  default     = false
  description = "Assign a public IP on launch for instances in the first private subnet."
}

variable "cidr-block-subnet-private-2" {
  type        = string
  default     = "10.0.2.0/24"
  description = "CIDR block for the second private subnet."
}

variable "az-subnet-private-2" {
  type        = string
  default     = "us-east-1b"
  description = "Availability Zone for the second private subnet."
}

variable "public-ip-on-launch-subnet-private-2" {
  type        = bool
  default     = false
  description = "Assign a public IP on launch for instances in the second private subnet."
}

variable "cidr-block-subnet-public-1" {
  type        = string
  default     = "10.0.3.0/24"
  description = "CIDR block for the first public subnet."
}

variable "az-subnet-public-1" {
  type        = string
  default     = "us-east-1a"
  description = "Availability Zone for the first public subnet."
}

variable "public-ip-on-launch-subnet-public-1" {
  type        = bool
  default     = true
  description = "Assign a public IP on launch for instances in the first public subnet."
}

variable "cidr-block-subnet-public-2" {
  type        = string
  default     = "10.0.4.0/24"
  description = "CIDR block for the second public subnet."
}

variable "az-subnet-public-2" {
  type        = string
  default     = "us-east-1b"
  description = "Availability Zone for the second public subnet."
}

variable "public-ip-on-launch-subnet-public-2" {
  type        = bool
  default     = true
  description = "Assign a public IP on launch for instances in the second public subnet."
}

variable "route_table_cidr_block" {
  type        = string
  default     = "0.0.0.0/0"
  description = "CIDR block for the route table."
}
