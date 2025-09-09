variable "vpc_cidr" {}
variable "public_subnets" {
  type = map(object({ cidr = string, az = string }))
}
variable "cluster_name" {}
