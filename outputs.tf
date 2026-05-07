output "ecr_repository_url" {
  description = "ECR repository URL — set as ECR_REPOSITORY_URI secret in the backend repo"
  value       = aws_ecr_repository.backend.repository_url
}

output "ecs_cluster_name" {
  description = "ECS cluster name — set as ECS_CLUSTER secret in the backend repo"
  value       = aws_ecs_cluster.main.name
}

output "ecs_service_name" {
  description = "ECS service name — set as ECS_SERVICE secret in the backend repo"
  value       = aws_ecs_service.backend.name
}

output "ecs_task_definition_family" {
  description = "ECS task definition family — used by deploy workflow to fetch current revision"
  value       = aws_ecs_task_definition.backend.family
}

output "frontend_bucket_name" {
  description = "S3 bucket name for frontend assets — set as S3_BUCKET secret in the frontend repo"
  value       = aws_s3_bucket.frontend.bucket
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID — set as CLOUDFRONT_DISTRIBUTION_ID secret in the frontend repo"
  value       = aws_cloudfront_distribution.frontend.id
}

output "cloudfront_domain_name" {
  description = "CloudFront domain name — your frontend is served from https://<this>"
  value       = aws_cloudfront_distribution.frontend.domain_name
}

output "alb_dns_name" {
  description = "ALB DNS name — your backend API is reachable at http://<this>/api/v1"
  value       = aws_lb.main.dns_name
}

output "gha_deploy_access_key_id" {
  description = "IAM access key ID for the GHA deploy user — set as AWS_ACCESS_KEY_ID in both app repos"
  value       = aws_iam_access_key.gha_deploy.id
}

output "gha_deploy_secret_access_key" {
  description = "IAM secret access key for the GHA deploy user — set as AWS_SECRET_ACCESS_KEY in both app repos"
  value       = aws_iam_access_key.gha_deploy.secret
  sensitive   = true
}

output "route53_nameservers" {
  description = "Add these 4 NS records on Porkbun under host 'careerops' for enovisoft.com to delegate the subdomain to Route 53"
  value       = aws_route53_zone.main.name_servers
}

output "frontend_url" {
  description = "Frontend URL"
  value       = "https://${var.frontend_domain}"
}

output "api_url" {
  description = "Backend API URL"
  value       = "https://${var.api_domain}"
}
