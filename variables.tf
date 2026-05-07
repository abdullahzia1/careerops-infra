variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "app_name" {
  description = "Application name prefix used for all resource names"
  type        = string
  default     = "careerops"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "prod"
}

variable "gemini_api_key" {
  description = "Google Gemini API key — stored in Secrets Manager, never in state output"
  type        = string
  sensitive   = true
}

variable "backend_port" {
  description = "Port the NestJS container listens on"
  type        = number
  default     = 3001
}

variable "backend_cpu" {
  description = "Fargate task CPU units (1024 = 1 vCPU)"
  type        = number
  default     = 1024
}

variable "backend_memory" {
  description = "Fargate task memory in MiB (Playwright needs >= 2048)"
  type        = number
  default     = 2048
}

variable "desired_count" {
  description = "Number of ECS tasks to run"
  type        = number
  default     = 1
}

variable "frontend_domain" {
  description = "Custom domain for the frontend CloudFront distribution"
  type        = string
  default     = "app.careerops.enovisoft.com"
}

variable "api_domain" {
  description = "Custom domain for the backend ALB"
  type        = string
  default     = "api.careerops.enovisoft.com"
}
