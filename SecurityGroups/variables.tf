variable "vpc_id" {
  type = string
}

variable "ports" {
    type = list(number)
    default = [ 22,443,80, 3306, 27017 ]
}