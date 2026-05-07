# ACM certificate must be in us-east-1 for CloudFront.
# Since the whole stack is us-east-1 the same cert works for the ALB too.

resource "aws_acm_certificate" "main" {
  domain_name               = "app.careerops.enovisoft.com"
  subject_alternative_names = ["api.careerops.enovisoft.com"]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = { Name = "${var.app_name}-cert" }
}

# Automatically create the CNAME validation records in Route 53
resource "aws_route53_record" "acm_validation" {
  for_each = {
    for dvo in aws_acm_certificate.main.domain_validation_options : dvo.domain_name => dvo
  }

  zone_id = aws_route53_zone.main.zone_id
  name    = each.value.resource_record_name
  type    = each.value.resource_record_type
  records = [each.value.resource_record_value]
  ttl     = 60

  allow_overwrite = true
}

# Wait for ACM to confirm validation before anything references the cert
resource "aws_acm_certificate_validation" "main" {
  certificate_arn         = aws_acm_certificate.main.arn
  validation_record_fqdns = [for r in aws_route53_record.acm_validation : r.fqdn]
}
