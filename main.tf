module "networking" {
  source = "./Networking"
}

module "iam" {
  source  = "./IAM"
  tls_eks = module.eks.tls_eks
}

module "eks" {
  source                                     = "./EKS"
  subnet_id_private_1                        = module.networking.subnet_id_private_1
  subnet_id_private_2                        = module.networking.subnet_id_private_2
  security_group_ids                         = module.security_groups.security_group_ids
  vpc_id                                     = module.networking.vpc_id
  subnet_id_public_1                         = module.networking.subnet_id_public_1
  bastion_sg_id                              = module.security_groups.bastion_sg_id
  eks_cluster_role_arn                       = module.iam.eks_cluster_role_arn
  node_role_arn                              = module.iam.node_role_arn
  eks_cluster_policy_attachment_id           = module.iam.eks_cluster_policy_attachment_id
  eks_cni_policy_attachment_id               = module.iam.eks_cni_policy_attachment_id
  eks_container_regitry_policy_attachment_id = module.iam.eks_container_regitry_policy_attachment_id
  worker_node_policy_attachment_id           = module.iam.worker_node_policy_attachment_id
  TF_VAR_public_key = var.TF_VAR_public_key
}

module "security_groups" {
  source = "./SecurityGroups"
  vpc_id = module.networking.vpc_id
}


