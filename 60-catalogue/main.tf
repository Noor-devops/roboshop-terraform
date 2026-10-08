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

resource "terraform_data" "catalogue" { 
  
  # Optional: Re-run this remote script automatically if the Server instance is replaced
  triggers_replace = [
    aws_instance.catalogue.id
  ]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    password = "DevOps321"
    host        = aws_instance.catalogue.private_ip
  }

  provisioner "file" {
    source      = "bootstrap.sh"       # Local file path
    destination = "/tmp/bootstrap.sh"         # Remote destination path
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh catalogue ${var.environment}"
    ]
  }
}