output "jenkins_secrets" {
  #value = data.aws_secretsmanager_secret.jenkins-secrets.kms_key_id
  value = [for secret in data.aws_secretsmanager_secret.jenkins-secrets.secret_list : secret.name]
}
