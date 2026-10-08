resource "aws_instance" "catalogue" {
  ami           = data.aws_ami.joindevops.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.catalogue_sg_id]
  subnet_id = local.private_subnet_id
  # iam_instance_profile = aws_iam_instance_profile.catalogue.name
  
  tags = merge(
    {
        Name = "${local.common_name}-catalogue"
    },
    local.common_tags
  )
}