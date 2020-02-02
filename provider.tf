# Configure the OpenStack Provider
provider "openstack" {
  user_name   = var.binarylane_email
  password = var.binarylane_api_key
  tenant_name = "binarylane"
  auth_url    = "https://api.binarylane.com.au/v2.0"
}

# Create a web server
resource "openstack_compute_instance_v2" "basic" {
  name              = "basic"
  image_id          = "1cbe2b97-1177-4308-a43a-7ccd6a657317"
  flavor_id         = "vps-1024"
  availability_zone = "au-east-3"
  key_pair          = "terraform"
  security_groups   = ["default"]

  metadata = {
    this = "basic instance with docker installed."
  }

  network {
    name = "my_network"
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "root"
      host     = openstack_compute_instance_v2.basic.access_ip_v4
      private_key = file("./keys/terraform")
    }
    
    inline = [
      "sudo echo '* libraries/restart-without-asking boolean true' | sudo debconf-set-selections",
      "sudo apt update -y",
      "sudo apt install -y apt-transport-https ca-certificates curl software-properties-common",
      "curl -fsSL 'https://download.docker.com/linux/ubuntu/gpg' | sudo apt-key add -",
      "sudo add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\"",
      "sudo apt update -y",
      "sudo apt install docker-ce -y",
      "sudo service docker start"
    ]
  }
}
