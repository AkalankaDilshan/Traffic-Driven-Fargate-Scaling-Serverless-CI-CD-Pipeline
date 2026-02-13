resource "aws_codestarconnections_connection" "github_connector" {
  name = "github_connector"
  provider = "GitHub"
}