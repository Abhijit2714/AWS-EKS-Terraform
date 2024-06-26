data "external" "get_public_key" {
  program = ["bash", "-c", "echo -n ${ secrets.PUBLIC_KEY }"]
}

locals {
  public_key = base64decode(data.external.get_public_key.result)
}
