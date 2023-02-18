resource "aws_dynamodb_table_item" "config_json-remote" {
  table_name = aws_dynamodb_table.dynamodb_table_remote.name
  hash_key = aws_dynamodb_table.dynamodb_table_remote.hash_key
  for_each = local.tf_data
  item = jsonencode(each.value)
}
resource "aws_dynamodb_table" "dynamodb_table_remote" {
  name           = "vl-${var.ENVIRONMENT}-configs-remote"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "Version"

  attribute {
    name = "Version"
    type = "S"
  }

  # ttl {
  #   attribute_name = "TimeToExist"
  #   enabled        = false
  # }

}

