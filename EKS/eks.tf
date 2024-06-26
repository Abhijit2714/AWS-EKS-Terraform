# eks cluster
resource "aws_eks_cluster" "eks-cluster" {
  name     = "${terraform.workspace}-test-eks-cluster"
  role_arn = var.eks_cluster_role_arn
  
  vpc_config {
    subnet_ids = [
      var.subnet_id_private_1,
      var.subnet_id_private_2
    ]
    endpoint_private_access = true
    endpoint_public_access  = false
    security_group_ids      = [var.security_group_ids]
  }
  depends_on = [var.eks_cluster_policy_attachment_id]
}

# aws node group 

resource "aws_eks_node_group" "private-nodes" {
  cluster_name    = aws_eks_cluster.eks-cluster.name
  node_group_name = "${terraform.workspace}-private-nodes"
  node_role_arn   = var.node_role_arn

  subnet_ids = [
    var.subnet_id_private_1,
    var.subnet_id_private_2
  ]

  capacity_type  = "ON_DEMAND"
  instance_types = ["t2.micro"]

  scaling_config {
    desired_size = 2
    max_size     = 10
    min_size     = 0
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    node = "kubenode02"
  }

  # taint {
  #   key    = "team"
  #   value  = "devops"
  #   effect = "NO_SCHEDULE"
  # }

  launch_template {
    name    = aws_launch_template.eks-with-disks.name
    version = aws_launch_template.eks-with-disks.latest_version
  }

  depends_on = [
    var.worker_node_policy_attachment_id,
    var.eks_cni_policy_attachment_id,
    var.eks_container_regitry_policy_attachment_id
  ]
}

# launch template if required

resource "aws_launch_template" "eks-with-disks" {
  name = "eks-with-disks"

  key_name = aws_key_pair.ssh-key-ec2-instance.key_name

  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size = 50
      volume_type = "gp2"
    }
  }
}

resource "aws_key_pair" "ssh-key-ec2-instance" {
  key_name   = var.ssh-keyname
  public_key = file("${path.module}/id_rsa.pub")
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230919"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "bastion" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.ssh-key-ec2-instance.key_name
  subnet_id              = var.subnet_id_public_1
  vpc_security_group_ids = [var.bastion_sg_id]
  tags = {
    Name = "Bastion-Host"
  }
}

