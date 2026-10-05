module "vpc" {
    source = "git::https://github.com/Noor-devops/terraform-vpc.git?ref=main"
    project     = var.project_name
    environment = var.environment
}