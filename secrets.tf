resource "aws_secretsmanager_secret" "gemini_api_key" {
  name                    = "${var.app_name}/gemini-api-key"
  description             = "Google Gemini API key for the ${var.app_name} backend"
  recovery_window_in_days = 7
}

resource "aws_secretsmanager_secret_version" "gemini_api_key" {
  secret_id     = aws_secretsmanager_secret.gemini_api_key.id
  secret_string = var.gemini_api_key
}
