{
  # Boot config
  boot.extraModprobeConfig = "options kvm_amd nested=1";

  # Libvirt & virt-manager
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
}
