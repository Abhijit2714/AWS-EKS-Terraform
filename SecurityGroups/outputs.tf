output "bastion_sg_id" {
  value = aws_security_group.bastion_sg.id
}

output "security_group_ids" {
    value = aws_security_group.allow_tls.id
}