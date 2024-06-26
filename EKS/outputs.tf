

output "eks_cluster_sg_id" {
  value = aws_eks_cluster.eks-cluster.id
}

output "tls_eks" {
  value = aws_eks_cluster.eks-cluster.identity[0].oidc[0].issuer
}