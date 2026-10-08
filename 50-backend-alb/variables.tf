variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "roboshop"
}

variable "environment" {
  description = "The environment for the project"
  type        = string
  default     = "dev"
}

variable "domain_name" {
  description = "The domain name for the project"
  type        = string
  default     = "nirfaws.online"
}

variable "zone_id" {
  description = "The Route 53 hosted zone ID"
  type        = string
  default     = "Z07090442QTQZUF01CVZY" # Replace with your actual hosted zone ID
}

