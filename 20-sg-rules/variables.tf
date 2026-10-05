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

variable "sg_name" {
  description = "The name of the security group"
  type        = list
  default     = [
    "mongodb", "redis", "mysql", "rabbbitmq"
    ]
}