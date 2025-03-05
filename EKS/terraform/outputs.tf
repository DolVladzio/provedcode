#########################################################################
# Outputs
#########################################################################
output "region" {
	value = var.region
}
#----------------------------
output "cluster_name" {
	value = var.cluster_name
}
#----------------------------
output "vpc_id" {
	description = "The ID of the VPC"
	value = module.vpc.vpc_id
}
#----------------------------
output "k8s_private-zone-1" {
	value = module.subnet.k8s_private-zone-1
}
#----------------------------
output "k8s_private-zone-2" {
	value = module.subnet.k8s_private-zone-2
}
#----------------------------
output "k8s_public-zone-1" {
	value = module.subnet.k8s_public-zone-1
}
#----------------------------
output "k8s_public-zone-2" {
	value = module.subnet.k8s_public-zone-2
}
#----------------------------
