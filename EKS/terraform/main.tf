# == Modules ==============================
module "vpc" {
	source = "./modules/vpc"
}
#----------------------------
module "subnet" {
	source = "./modules/subnet"
	vpc_id = module.vpc.vpc_id
	cluster_name = path.module
}
#----------------------------
# module "cluster" {
# 	source = "./modules/cluster"
# 	env = path.module
# 	cluster_name = path.module
# }
#----------------------------
# == Cluster ==============================
