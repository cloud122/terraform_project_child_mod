locals {
  json_data = file("${path.module}/env/test-config.json")
  tf_data = jsondecode(local.json_data)
}