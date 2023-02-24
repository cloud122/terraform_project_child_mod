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
                "secret": ""
            }
      EOF
  lifecycle {
    #---does not override existing values
    ignore_changes = [secret_string]
  }
}

/*
aws secretsmanager put-secret-value \
    --secret-id MyTestSecret \
    --secret-string file://mycreds.json

Contents of mycreds.json:

{
    "engine": "mysql",
    "username": "saanvis",
    "password": "EXAMPLE-PASSWORD",
    "host": "my-database-endpoint.us-west-2.rds.amazonaws.com",
    "dbname": "myDatabase",
    "port": "3306"
}
*/