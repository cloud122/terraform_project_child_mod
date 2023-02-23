output "jenkins_secrets_keys" {
  value = jsondecode(data.aws_secretsmanager_secret_version.jenkins_secrets_version.secret_string)
  #value = [for secret in data.aws_secretsmanager_secret.jenkins_secrets.secret_list : secret.name]
  sensitive = true
}

# output "jenkins_secrets_keys" {
#   value = jsondecode(data.aws_secretsmanager_secret_version.jenkins_secrets_version.secret_string)
#   #value = [for secret in data.aws_secretsmanager_secret.jenkins_secrets.secret_list : secret.name]
#   sensitive = true
# }

# output "jenkins_secrets_keys2" {
#   value = jsondecode(data.aws_secretsmanager_secret_version.jenkins_secrets_version.secret_string)["pass"]
#   sensitive = true
# }