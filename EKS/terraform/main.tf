#########################################################################
# Modules 
#########################################################################
module "vpc" {
	source = "./modules/vpc"
}
#----------------------------
module "subnet" {
	source = "./modules/subnet"
	vpc_id = module.vpc.vpc_id
	cluster_name = path.module
}
#########################################################################
# Cluster 
#########################################################################
module "eks" {
	source  = "terraform-aws-modules/eks/aws"
	version = "~> 20.31"
	
	cluster_name    = var.cluster_name
	cluster_version = var.cluster_version
	cluster_endpoint_public_access = true
	#----------------------------
	cluster_addons = {
		coredns                = {}
		eks-pod-identity-agent = {}
		kube-proxy             = {}
		vpc-cni                = {}
	}
	#----------------------------
	vpc_id = module.vpc.vpc_id

	control_plane_subnet_ids = [
		module.subnet.k8s_private-zone-1,
		module.subnet.k8s_private-zone-2
	]
	subnet_ids = [
		module.subnet.k8s_private-zone-1,
		module.subnet.k8s_private-zone-2
	]
	
	enable_cluster_creator_admin_permissions = true
	#----------------------------
	eks_managed_node_groups = {
		example = {
			desired_size = 1
			min_size     = 1
			max_size     = 1
			
			instance_types = ["t3.medium"]
		}
	}
}
#----------------------------
