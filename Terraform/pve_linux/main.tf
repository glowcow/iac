resource "proxmox_vm_qemu" "pve-vm" {
  count = var.vm_count
  target_node = var.pve_node
  name = "pve-vm-n${count.index}"
  onboot = true 
  clone = var.pve_tmp
  agent = 1
  cores = var.cores_count   
  memory = var.mem_count
  network {
      bridge = "vmbr0"
      model  = "virtio"
  }
  os_type = "cloud-init"
  # (Optional) IP Address and Gateway
  ipconfig0 = "ip=${element(var.pve_vm_ip, count.index)},gw=10.1.1.1"
  # (Optional) Default User
  # ciuser = "your-username"
  # (Optional) Add your SSH KEY
  # sshkeys = <<EOF
  # #YOUR-PUBLIC-SSH-KEY
  # EOF
  connection {
      type        = "ssh"
      host        = element(var.pve_vm_ip, count.index)
      user        = var.def_user
      private_key = file(var.pvt_key)
      timeout     = "1m"
   }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
    ]
  }
}