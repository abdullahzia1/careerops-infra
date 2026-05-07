# Subdomain-delegated hosted zone — only careerops.enovisoft.com is managed here.
# enovisoft.com root stays on Porkbun; Vercel portfolio is unaffected.

resource "aws_route53_zone" "main" {
  name = "careerops.enovisoft.com"

  tags = { Name = "${var.app_name}-zone" }
}

# ── Frontend — app.careerops.enovisoft.com → CloudFront ──────────────────────

resource "aws_route53_record" "frontend" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "app.careerops.enovisoft.com"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.frontend.domain_name
    zone_id                = aws_cloudfront_distribution.frontend.hosted_zone_id
    evaluate_target_health = false
  }
}

# ── Backend — api.careerops.enovisoft.com → ALB ───────────────────────────────

resource "aws_route53_record" "api" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "api.careerops.enovisoft.com"
  type    = "A"

  alias {
    name                   = aws_lb.main.dns_name
    zone_id                = aws_lb.main.zone_id
    evaluate_target_health = true
  }
}
