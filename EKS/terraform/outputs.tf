#########################################################################
# Outputs
#########################################################################
output "cluster_name" {
	value = local.name
}
#-----------------------------------------------------
output "region" {
	value = local.region
}
#-----------------------------------------------------
output "vpc_id" {
	value = module.vpc.vpc_id
}
#-----------------------------------------------------
output "private_subnets" {
	value = module.vpc.private_subnets
}
#-----------------------------------------------------
output "public_subnets" {
	value = module.vpc.public_subnets
}
#-----------------------------------------------------
output "eks_cluster_id" {
	value = module.eks.cluster_id
}
#-----------------------------------------------------
