variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west4"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable private_key_path {
  description = "Path to the private key"
}

variable zone {
  description = "Zone"
  default     = "europe-west4-b"
}

variable docker_disk_image {
  description = "Disk image for docker"
}

variable source_ranges {
  description = "Source IPs"
  type        = "list"
}

variable "count" {
  description = "Instances count"
  default     = 1
}
