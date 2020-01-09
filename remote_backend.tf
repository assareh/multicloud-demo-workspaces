terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "root-beer"

    workspaces {
      name = "multicloud-demo-workspaces"
    }
  }
}
