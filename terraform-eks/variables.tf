variable "region" {}
variable "cluster_name" {}
variable "vpc_cidr" {}
variable "public_subnets" {
  type = map(object({
    cidr = string
    az   = string
  }))
}
variable "eks_version" {}
variable "node_desired_size" {}
variable "node_max_size" {}
variable "node_min_size" {}
variable "node_instance_types" {
  type = list(string)
}
variable "node_ami_type" {}
variable "ec2_key_name" {}
