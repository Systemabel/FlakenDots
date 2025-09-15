{pkgs, ...}: {
  # Change "orca" to a unique username-- dont use something generic like "user".
  # because that just makes things more ambiguous, obviously.
  users.groups.orca = {};
  users.users.orca = {
    isNormalUser = true;
    # Change me!
    name = "orca";
    home = "/home/orca";
    description = "orca";
    # Change me! generate with `mkpasswd -m SHA-512 -s`
    # initialHashedPassword = "$6$9I35TBWjqxI.jPEm$fX37utl6dDHFMd0V5l5ZmwVcuOGFdaKWkngIZCv.ML8GFxOg5dhxvpIeHLc6TxGYW6paw5b3Nx5ujls/ChWXC.";

    # "your-user"
    group = "orca";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
      "audio"
      "video"
      "input"
      "i2c"
      "scanner"
      "lp"
      "root"
      "sudo"
    ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      trusted-users = [
        "root"
        "orca"
      ]; # Set users that are allowed to use the flake command
    };
  };
  imports = [./orca];
  # fileSystems = {
  #   "/home/orca/archroot" = {
  #     device = "/dev/disk/by-uuid/cad53379-89a4-4110-b033-c6686ca0274d";
  #     fsType = "btrfs";
  #     depends = ["/home"];
  #     options = [
  #       "subvol=@"
  #       "noatime"
  #       "compress=zstd"
  #       "autodefrag"
  #     ];
  #   };
  # "/home/.mountme" = {
  #   device = "/dev/disk/by-uuid/2e8b0fa2-be26-45dc-a19a-9bcfec2efd7f";
  #   fsType = "btrfs";
  #   depends = ["/home"];
  #   options = [
  #     "subvol=@home"
  #     "noatime"
  #     "compress=zstd"
  #     "autodefrag"
  #   ];
  # };
  # "/home/myliege" = {
  #   device = "/home/.mountme/myliege";
  #   fsType = "none";
  #   depends = ["/home/.mountme"];
  #   options = ["bind"];
  # };
  # "/home/orca/Games" = {
  #   device = "/dev/disk/by-uuid/2e8b0fa2-be26-45dc-a19a-9bcfec2efd7f";
  #   fsType = "btrfs";
  #   depends = ["/home"];
  #   options = [
  #     "subvol=@games"
  #     "noatime"
  #     "compress=zstd"
  #     "autodefrag"
  #   ];
  # };
  # };
}
