variable "cluster_name" {}
variable "subnet_ids" { type = list(string) }
variable "sg_id" {}
variable "cluster_role_arn" {}
variable "node_role_arn" {}
variable "eks_version" {}
variable "node_desired_size" {}
variable "node_max_size" {}
variable "node_min_size" {}
variable "node_instance_types" { type = list(string) }
variable "node_ami_type" {}
variable "ec2_key_name" {}

variable "cluster_depends_on" { type = list(any) }
variable "node_depends_on" { type = list(any) }
