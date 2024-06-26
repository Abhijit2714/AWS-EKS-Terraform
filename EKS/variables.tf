variable "subnet_id_private_1" {
  type        = string
  description = "ID of the first private subnet."
}

variable "subnet_id_private_2" {
  type        = string
  description = "ID of the second private subnet."
}

variable "security_group_ids" {
  type        = string
  description = "IDs of the security groups."
}

variable "bastion_sg_id" {
  type        = string
  description = "ID of the bastion host security group."
}

variable "ssh-keyname" {
  type        = string
  default     = "node-ssh-key"
  description = "Name of the SSH key pair."
}

variable "subnet_id_public_1" {
  type        = string
  description = "ID of the first public subnet."
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC."
}

variable "eks_cluster_role_arn" {
  type        = string
  description = "ARN of the EKS cluster IAM role."
}

variable "eks_cluster_policy_attachment_id" {
  type        = string
  description = "ID of the EKS cluster policy attachment."
}

variable "node_role_arn" {
  type        = string
  description = "ARN of the node group IAM role."
}

variable "worker_node_policy_attachment_id" {
  type        = string
  description = "ID of the worker node policy attachment."
}

variable "eks_cni_policy_attachment_id" {
  type        = string
  description = "ID of the EKS CNI policy attachment."
}

variable "eks_container_regitry_policy_attachment_id" {
  type        = string
  description = "ID of the Amazon EC2 Container Registry Read-Only policy attachment."
}
