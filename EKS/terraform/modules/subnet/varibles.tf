#----------------------------
variable "env" {
	type    = string
	default = "k8s"
}
#----------------------------
variable "vpc_id" {}
#----------------------------
variable "cluster_name" {}
#----------------------------
variable "zone-1" {
	type    = string
	default = "eu-west-1a"
}
#----------------------------
variable "zone-2" {
	type    = string
	default = "eu-west-1b"
}
#----------------------------
variable "k8s_private-zone-1" {
	type = string
	default = "10.0.0.0/19"
}
#----------------------------
variable "k8s_private-zone-2" {
	type = string
	default = "10.0.32.0/19"
}
#----------------------------
variable "k8s_public-zone-1" {
	type = string
	default = "10.0.64.0/19"
}
#----------------------------
variable "k8s_public-zone-2" {
	type = string
	default = "10.0.96.0/19"
}
#----------------------------
