data "aws_secretsmanager_secret" "jenkins_secrets" {
  name = "${var.ENVIRONMENT}/jenkins/automation"
}
data "aws_secretsmanager_secret_version" "jenkins_secrets_version" {
  secret_id = data.aws_secretsmanager_secret.jenkins_secrets.id
}