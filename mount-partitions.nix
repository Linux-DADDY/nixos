{
  # Laptop's HDD
  # Home_Backup_Drive
  fileSystems."/media/Home_Backup_Drive" = {
    device = "/dev/disk/by-label/Home_Backup_Driv";
    fsType = "btrfs";
    options = ["defaults" "rw" "noatime" "autodefrag" "compress=zstd" "space_cache=v2" "commit=120"];
  };

  # Random_Things_Drive
  fileSystems."/media/Random_Things_Drive" = {
    device = "/dev/disk/by-label/Random_Drive";
    fsType = "btrfs";
    options = ["defaults" "rw" "noatime" "autodefrag" "compress=zstd" "space_cache=v2" "commit=120"];
  };

  # Personal_Drive
  fileSystems."/media/Personal_Drive" = {
    device = "/dev/disk/by-label/Personal";
    fsType = "btrfs";
    options = ["defaults" "rw" "noatime" "autodefrag" "compress=zstd" "space_cache=v2" "commit=120"];
  };

  # Image_Videos_Bac
  fileSystems."/media/Image_Videos_Bac" = {
    device = "/dev/disk/by-label/Image_Videos_Bac";
    fsType = "btrfs";
    options = ["defaults" "rw" "noatime" "autodefrag" "compress=zstd" "space_cache=v2" "commit=120"];
  };

  # Workflow_Drive
  fileSystems."/media/WorkFlow_Drive" = {
    device = "/dev/disk/by-label/Workflow_Drive";
    fsType = "btrfs";
    options = ["defaults" "rw" "noatime" "autodefrag" "compress=zstd" "space_cache=v2" "commit=120"];
  };

  # Backup_Drive
  fileSystems."/media/Backup_Drive" = {
    device = "/dev/disk/by-label/Backup_Drive";
    fsType = "btrfs";
    options = ["defaults" "rw" "noatime" "autodefrag" "compress=zstd" "space_cache=v2" "commit=120"];
  };

  # A TECH HDD
  # Media Server
  fileSystems."/media/Tutorials" = {
    device = "/dev/disk/by-label/Tutorials";
    fsType = "btrfs";
    options = ["defaults" "rw" "noatime" "autodefrag" "compress=zstd" "space_cache=v2" "commit=120"];
  };

  # Media Server
  fileSystems."/media/Media_Server" = {
    device = "/dev/disk/by-label/Media_Server";
    fsType = "btrfs";
    options = ["defaults" "rw" "noatime" "autodefrag" "compress=zstd" "space_cache=v2" "commit=120"];
  };

  # Matrix HDD
  # Virtual Boot Drive
  fileSystems."/media/Virtual_Boot_Drive" = {
    device = "/dev/disk/by-label/Virtual_Boot_Drive";
    fsType = "btrfs";
    options = ["defaults" "rw" "noatime" "autodefrag" "compress=zstd" "space_cache=v2" "commit=120"];
  };

  # Download Server
  fileSystems."/media/Download_Server" = {
    device = "/dev/disk/by-label/Downloads_Drive";
    fsType = "btrfs";
    options = ["defaults" "rw" "noatime" "autodefrag" "compress=zstd" "space_cache=v2" "commit=120"];
  };
}
