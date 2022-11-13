output "connect_cli" {
  description = "Instance connect command"
  value       = "ssh unicloud@"+var.vm_ip
}