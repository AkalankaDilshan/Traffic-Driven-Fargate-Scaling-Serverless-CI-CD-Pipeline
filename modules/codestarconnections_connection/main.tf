# resource "aws_codestarconnections_connection" "github_connector" {
#   name = var.connector_name
#   provider = "github"
# }

resource "aws_codestarconnections_connection" "github_connector" {
  name          = var.connector_name
  provider_type = "GitHub"
  provider      = aws  # or aws.your_alias if using an alias
}