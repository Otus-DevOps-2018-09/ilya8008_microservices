resource "google_compute_firewall" "firewall_ssh_puma" {
  name    = "default-allow-ssh-puma"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22","9292"]
  }

  source_ranges = "${var.source_ranges}"
}
