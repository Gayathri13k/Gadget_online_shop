region        = "us-east-1"
cluster_name  = "dev-eks-cluster"
ec2_key_name  = "retail-key"

vpc_cidr = "10.0.0.0/16"

public_subnets = {
  subnet1 = { cidr = "10.0.1.0/24", az = "us-east-1a" }
  subnet2 = { cidr = "10.0.2.0/24", az = "us-east-1b" }
}

eks_version        = "1.28"
node_desired_size  = 2
node_max_size      = 3
node_min_size      = 1
node_instance_types= ["t3.medium"]
node_ami_type      = "AL2_x86_64"
