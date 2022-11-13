output "connect_cli" {
  description = "Instance connect ip"
  value       = "ssh unicloud@${var.vm_ip}"
}