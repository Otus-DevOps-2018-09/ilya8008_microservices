variable public_key_path {
  description = "Path to the public key used to connect to instance"
}

variable private_key_path {
  description = "Path to the public key used to connect to instance"
}

variable zone {
  description = "Zone"
}

variable docker_disk_image {
  description = "Disk image for docker"
}

variable "count" {
  description = "Instances count"
  default     = 1
}
