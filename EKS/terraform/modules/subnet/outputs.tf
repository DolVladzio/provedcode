#########################################################################
# Outputs
#########################################################################
output "k8s_private-zone-1" {
	value = aws_subnet.k8s_private-zone-1.id
}
#----------------------------
output "k8s_private-zone-2" {
	value = aws_subnet.k8s_private-zone-2.id
}
#----------------------------
output "k8s_public-zone-1" {
	value = aws_subnet.k8s_public-zone-1.id
}
#----------------------------
output "k8s_public-zone-2" {
	value = aws_subnet.k8s_public-zone-2.id
}
#----------------------------
