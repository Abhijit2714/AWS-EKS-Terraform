output "eks_cluster_role_arn" {
  value = aws_iam_role.eks-cluster-role.arn
}

output "eks_cluster_policy_attachment_id" {
  value = aws_iam_role_policy_attachment.eks-cluster-AmazonEKSClusterPolicy.id
}

output "node_role_arn" {
  value = aws_iam_role.nodes.arn
}

output "worker_node_policy_attachment_id" {
  value = aws_iam_role_policy_attachment.nodes-AmazonEKSWorkerNodePolicy.id
}

output "eks_cni_policy_attachment_id" {
  value = aws_iam_role_policy_attachment.nodes-AmazonEKS_CNI_Policy.id
}

output "eks_container_regitry_policy_attachment_id" {
  value = aws_iam_role_policy_attachment.nodes-AmazonEC2ContainerRegistryReadOnly.id
}

output "eks_cluster_autoscaler_arn" {
  value = aws_iam_role.eks_cluster_autoscaler.arn
}
