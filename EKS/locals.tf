data "external" "get_public_key" {
  program = ["bash", "-c", "echo -n \"${{ secrets.PUBLIC_KEY }}\""]
}


