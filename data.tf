data "aws_secretsmanager_secret" "jenkins-secrets" {
  name = "${var.ENVIRONMENT}/jenkins/automation"
}