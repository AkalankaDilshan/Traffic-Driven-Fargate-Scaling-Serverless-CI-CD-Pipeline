resource "aws_codestarconnections_connection" "github_connector" {
  name = var.connector_name
  provider = "github"
}