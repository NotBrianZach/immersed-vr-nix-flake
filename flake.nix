{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  outputs = inputs:
    let pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
    in {
      defaultPackage.x86_64-linux = pkgs.appimageTools.wrapType1 {
        name = "immersed-vr";
        src = builtins.fetchurl {
          url = "https://immersed.com/dl/Immersed-x86_64.AppImage";
          sha256 = "0fbqmcjb7255cipdac2afyfcn4lq27x8q9sg4p4j5day82i2y6i8";
        };
        extraPkgs = pkgs: with pkgs; [
          libthai
          libpulseaudio
          glibc
        ];
      };
    };
}
