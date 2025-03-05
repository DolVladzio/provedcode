#########################################################################
# Variables
#########################################################################
variable "region" {
	type    = string
	default = "eu-west-1"
}
#----------------------------
variable "env" {
	type    = string
	default = "k8s"
}
#----------------------------
variable "cluster_name" {
	type    = string
	default = "k8s-EKS"
}
#----------------------------
variable "cluster_version" {
	type = string
	default = "1.31"
}
#----------------------------
