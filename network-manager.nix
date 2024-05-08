{
  config,
  pkgs,
  lib,
  ...
}: {
  networking = {
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };
    # plugins = with pkgs; [
    #   networkmanager-openvpn
    # ];
    firewall = {
      enable = true;
      checkReversePath = "loose";
      allowedTCPPorts = [80 443];
      allowedUDPPortRanges = [
        {
          from = 4000;
          to = 4007;
        }
        {
          from = 8000;
          to = 8010;
        }
      ];
    };
  };
  services = {
    resolved = {
      enable = true;
      extraConfig = ''
        DNS=45.90.28.0#6b38b9.dns.nextdns.io
        DNS=2a07:a8c0::#6b38b9.dns.nextdns.io
        DNS=45.90.30.0#6b38b9.dns.nextdns.io
        DNS=2a07:a8c1::#6b38b9.dns.nextdns.io
        DNSOverTLS=yes
      '';
    };
  };
}
