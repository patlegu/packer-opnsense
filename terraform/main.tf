provider "hcloud" {
  token = "${var.hcloud_token}"
}

module "s3" {
  source = "./s3"
  datacenter = "${var.datacenter}"
  ssh_user = "${var.ssh_user}"
  ssh_port = "${var.ssh_port}"
  release = "${var.release}"
  cloudflare_email = "${var.cloudflare_email}"
  cloudflare_token = "${var.cloudflare_token}"
}

module "web" {
  source = "./web"
  datacenter = "${var.datacenter}"
  ssh_user = "${var.ssh_user}"
  ssh_port = "${var.ssh_port}"
  release = "${var.release}"
}

variable "hcloud_token" {}
variable "datacenter" {}
variable "ssh_user" {}
variable "ssh_port" {}
variable "release" {}
variable "cloudflare_email" {}
variable "cloudflare_token" {}


