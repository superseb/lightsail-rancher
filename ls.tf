resource "aws_lightsail_instance" "rancherserver" {
  count             = "1"
  name              = "rancherserver"
  availability_zone = "us-east-1b"
  blueprint_id      = "ubuntu_16_04"
  bundle_id         = "medium_1_0"
  key_pair_name     = "lightsail"
  user_data         = "${file("user_data_server.txt")}"
}

resource "aws_lightsail_instance" "rancheragent" {
  count             = "2"
  name              = "rancheragent-${count.index}"
  availability_zone = "us-east-1b"
  blueprint_id      = "ubuntu_16_04"
  bundle_id         = "medium_1_0"
  key_pair_name     = "lightsail"
  user_data         = "${file("user_data_agent.txt")}"
}
