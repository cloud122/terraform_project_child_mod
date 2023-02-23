#---- terraform import aws_secretsmanager_secret.jenkins_secrets test/jenkins/automation
resource "aws_secretsmanager_secret" "jenkins_secrets" {
  name = "${var.ENVIRONMENT}/jenkins/automation"
}

resource "aws_secretsmanager_secret_version" "jenkins_secrets_map" {
  secret_id     = aws_secretsmanager_secret.jenkins_secrets.id
  secret_string = <<-EOF
              {
                "username": "testuser",
                "password": "testpass",
                "token": "testtoken",
                "secret": "testsecret"
            }
      EOF
  lifecycle {
    #---does not override existing values
    ignore_changes = [secret_string]
  }
}