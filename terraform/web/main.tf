data "hcloud_image" "db" {
  selector = "name=db_${var.release}"
}

resource "hcloud_server" "web" {
  name = "web-${var.release}"
  image = "${data.hcloud_image.web.id}"
  server_type = "cx11"
  datacenter = "${var.datacenter}"
  count = 1
  labels = {
    name = "web-${var.release}"
    app = "web"
    release = "${var.release}"
  }
}


resource "null_resource" "web" {
  triggers {
    s3_id = "${hcloud_server.web.id}"
  }

  connection {
    host = "${hcloud_server.web.ipv4_address}"
    user = "${var.ssh_user}"
    port = "${var.ssh_port}"
  }

  provisioner "file" {
    source = "scripts/postgresql/files/postgresql-backup.sh"
    destination = "/tmp/postgresql-backup.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo -H bash /tmp/postgresql-backup.sh restore all || exit 0",
    ]
  }
}


variable "datacenter" {}
variable "ssh_user" {}
variable "ssh_port" {}
variable "release" {}
